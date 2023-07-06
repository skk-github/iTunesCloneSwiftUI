//
//  SearchAllView.swift
//  iTunesCloneSwiftUI
//
//  Created by Krishna on 05/07/23.
//

import SwiftUI

struct SearchAllView: View {
    
    @ObservedObject var viewModel: SearchAllViewModel
//    @Binding var searchTearm: String
    
    var body: some View {
        NavigationView {
        
            VStack{
                Picker("StringProtocol", selection: $viewModel.selectedEntity) {
                    ForEach(SearchEntityType.allCases) { value in
                        Text(value.name())
                            .tag(value)
                    }
                }.pickerStyle(.segmented)
                Spacer()
                switch viewModel.selectedEntity {
                case .all:
                    SearchCollectionView(albumViewModel: viewModel.albumListVM, movieViewModel: viewModel.movieListVM)
                case .album:
                    AlbumListView(viewModel: viewModel.albumListVM)
                case .movie:
                    MovieListView(viewModel: viewModel.movieListVM)
                case .song:
                    Text("search all count \(viewModel.albumListVM.albumList.count + viewModel.movieListVM.movieList.count)")
                    Text("search album count \(viewModel.albumListVM.albumList.count)")
                    Text("search moview count \(viewModel.movieListVM.movieList.count)")
                
                    
                }
                
                Spacer()
                
                
            }
            
            .searchable(text: $viewModel.searchTearm)
        }
        
    }
}

struct SearchAllView_Previews: PreviewProvider {
    static var previews: some View {
        SearchAllView(viewModel: SearchAllViewModel())
    }
}
