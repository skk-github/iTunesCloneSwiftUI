//
//  HomeViewModel.swift
//  iTunesCloneSwiftUI
//
//  Created by Krishna on 05/07/23.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var searchAllVM: SearchAllViewModel = SearchAllViewModel()
    @Published var albumListVM: AlbumListViewModel = AlbumListViewModel()
    @Published var movieListVM: MovieListViewModel = MovieListViewModel()
    
    
}
