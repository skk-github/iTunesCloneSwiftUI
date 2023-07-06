//
//  SearchCollectionView.swift
//  iTunesCloneSwiftUI
//
//  Created by Krishna on 06/07/23.
//

import SwiftUI

struct SearchCollectionView: View {
    
    @ObservedObject var albumViewModel: AlbumListViewModel
    @ObservedObject var movieViewModel: MovieListViewModel
   
    var body: some View {
        ScrollView{
            HStack(alignment:.center){
                Text(SearchEntityType.movie.name())
                Spacer()
                NavigationLink {
                    MovieListView(viewModel: movieViewModel)
                } label: {
                    Text("See all")
                        .font(.caption)
                    Image(systemName: "chevron.right")
                        .frame(width: 20, height: 20)
                }
            }.padding(.horizontal,10)
            
            SearchAllMovieSectionView(movieList: movieViewModel.movieList)
            
            
        }
    }
}

struct SearchCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        SearchCollectionView(albumViewModel: AlbumListViewModel.sampleVM(), movieViewModel: MovieListViewModel.sampleVM())
    }
}
