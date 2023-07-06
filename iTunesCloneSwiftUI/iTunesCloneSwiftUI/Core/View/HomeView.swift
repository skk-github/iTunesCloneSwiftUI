//
//  ContentView.swift
//  iTunesCloneSwiftUI
//
//  Created by Krishna on 03/07/23.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var albumListVM =  AlbumListViewModel()
    @StateObject private var movieListVM = MovieListViewModel()
    
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        
        TabView {
            
            
            SearchAllView(viewModel: viewModel.searchAllVM)
                .tabItem {
                    Label(SearchEntityType.all.name(),systemImage: "magnifyingglass")
                        
                }
            AlbumMainView(viewModel: viewModel.albumListVM)
                .tabItem {
                    Label(SearchEntityType.album.name(),systemImage: "record.circle.fill")
                        
                }
            MovieMainView(viewModel: viewModel.movieListVM)
                .tabItem {
                    Label(SearchEntityType.movie.name(),systemImage: "film")
                }
                
            
        }
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
