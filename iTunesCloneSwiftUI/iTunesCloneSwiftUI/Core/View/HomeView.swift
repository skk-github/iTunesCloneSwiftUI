//
//  ContentView.swift
//  iTunesCloneSwiftUI
//
//  Created by Krishna on 03/07/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        
        TabView {
           
            AlbumMainView(viewModel: AlbumListViewModel())
                .tabItem {
                    Label(SearchEntityType.album.name(),systemImage: "record.circle.fill")
                        
                }
            MovieMainView(viewModel: MovieListViewModel())
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
