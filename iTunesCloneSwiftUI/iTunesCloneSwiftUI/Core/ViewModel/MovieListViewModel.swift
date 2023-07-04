//
//  MovieListViewModel.swift
//  iTunesCloneSwiftUI
//
//  Created by Krishna on 04/07/23.
//

import Foundation
import Combine


class MovieListViewModel: ObservableObject {
    
    @Published var searchTearm: String = ""
    @Published var movieList: [MovieItem] = []
    @Published var paginationStatus: PaginationLoadingStatus = .canLoad
    
    var subscription = Set<AnyCancellable>()
    var pageNo = 0
    let limit = 20
    let apiManager = ApiCallManager()
    
    init() {
        $searchTearm
            .dropFirst()
            .removeDuplicates()
            .debounce(for: 0.3, scheduler: RunLoop.main)
            .sink { [weak self] tearm in
                guard let self = self else {return}
                self.movieList = []
                self.pageNo = 0
                self.fetchMovies()
            }.store(in: &subscription)
    }
    
    
    func fetchMovies() {
        guard !searchTearm.isEmpty else {return}
        let offset = pageNo * limit
        guard let url = apiManager.genereateUrl(entityType: .movie, keyword: searchTearm, offset: offset, limit: limit) else {
            paginationStatus = .error(ApiError.badUrl.description)
            return
        }
        
        Task {
            do {
                let movie: Movie = try await apiManager.fetchRecords(url: url)
                await MainActor.run {
                    pageNo += 1
                    paginationStatus = movie.results.count < limit ? .loadedAllPages : .canLoad
                    movieList += movie.results
                }
                
                
            }catch{
                await MainActor.run {
                    if let err = error as? ApiError {
                        paginationStatus = .error(err.description)
                    }else{
                        paginationStatus = .error(error.localizedDescription)
                    }
                }
            }
        }
    }
    
    
    static func sampleVM() -> MovieListViewModel {
        
        let vm = MovieListViewModel()
        vm.movieList = [MovieItem.sampleItem()]
        return vm
    }
}
