//
//  SearchAllViewModel.swift
//  iTunesCloneSwiftUI
//
//  Created by Krishna on 05/07/23.
//

import Foundation
import Combine


class SearchAllViewModel: ObservableObject {
    
    @Published var albumListVM: AlbumListViewModel = AlbumListViewModel()
    @Published var movieListVM: MovieListViewModel = MovieListViewModel()
    @Published var selectedEntity: SearchEntityType = .all
    @Published var searchTearm: String = ""
    
    var subscription = Set<AnyCancellable>()
    
    init() {
        $searchTearm
            .dropFirst()
            .sink {[weak self] searchTearm in
                guard let self = self else {return}
                albumListVM.searchTearm = searchTearm
                movieListVM.searchTearm = searchTearm
            }.store(in: &subscription)
    }
   
    
    
}
