//
//  AlbumListViewModel.swift
//  iTunesCloneSwiftUI
//
//  Created by Krishna on 03/07/23.
//

import Foundation
import Combine


class AlbumListViewModel: ObservableObject {
    
    @Published var searchTearm : String = ""
    @Published var albumList: [AlbumItem] = []
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
                self.fetchAlbum()
            }.store(in: &subscription)
    }
    
    
    func fetchAlbum() {
        let offset = pageNo * limit
        let url = ApiCallManager().genereateUrl(entityType: .album, keyword: searchTearm, offset: offset, limit: limit)
        
        Task {
            do{
                let album: Album = try await apiMangaer.fetchRecords(url: url)
                
                pageNo += 1
                await MainActor.run(body: {
                    albumList = album.results
                })
            }catch{
                if let apiError = error as? ApiError {
                    print(apiError.description)
                }else{
                    print(error.localizedDescription)
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
