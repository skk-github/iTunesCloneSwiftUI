//
//  AlbumListViewModel.swift
//  iTunesCloneSwiftUI
//
//  Created by Krishna on 03/07/23.
//

import Foundation
import Combine


enum PaginationLoadingStatus: Equatable {
    case canLoad, loading, loadedAllPages
    case error(String)
}



class AlbumListViewModel: ObservableObject {
    
    @Published var searchTearm : String = ""
    @Published var albumList: [AlbumItem] = []
    @Published var paginationStatus: PaginationLoadingStatus = .canLoad
    lazy var apiMangaer = ApiCallManager()
    let limit = 20
    var pageNo = 0
    var subscription = Set<AnyCancellable>()
    
    init() {
        $searchTearm
            .dropFirst()
            .removeDuplicates()
            .debounce(for: (0.5), scheduler: RunLoop.main)
            .sink { [weak self] value in
                guard let self = self else {return}
                self.albumList = []
                self.pageNo = 0
                self.paginationStatus = .canLoad
                self.fetchAlbum()
            }.store(in: &subscription)
    }
    
    
    func fetchAlbum() {
        guard !searchTearm.isEmpty else {return}
        let offset = pageNo * limit
        let url = ApiCallManager().genereateUrl(entityType: .album, keyword: searchTearm, offset: offset, limit: limit)
        paginationStatus = .loading
        Task {
            do{
                
                let album: Album = try await apiMangaer.fetchRecords(url: url)
                
                pageNo += 1
                await MainActor.run(body: {
                    paginationStatus = album.results.count < limit ? .loadedAllPages : .canLoad
                    albumList += album.results
                })
            }catch{
                if let apiError = error as? ApiError {
                    await MainActor.run(body: {
                        paginationStatus = .error(apiError.localizedDescription)
                    })
                    print(apiError.description)
                }else{
                    await MainActor.run(body: {
                        paginationStatus = .error(error.localizedDescription)
                    })
                    
                }
                    
            }
            
        }
    }
    
    static func sampleVM() -> AlbumListViewModel {
        let vm = AlbumListViewModel()
        vm.albumList = [AlbumItem.sampleItem()]
        return vm
    }
    
}
