//
//  AlbumListView.swift
//  iTunesCloneSwiftUI
//
//  Created by Krishna on 03/07/23.
//

import SwiftUI

struct AlbumListView: View {
    
    @ObservedObject var viewModel: AlbumListViewModel
    
    var body: some View {
        List{
            ForEach(viewModel.albumList) { album in
                AlbumRowView(albumItem: album)
            }
            
            
            
            switch viewModel.paginationStatus {
                
            case .canLoad:
                Color.clear
                    .frame(height: 50.0)
                    .onAppear{
                        viewModel.fetchAlbum()
                    }
            case .error(let errMsg):
                Text(errMsg)
                    .foregroundColor(Color.red)
                
            case .loading:
                ProgressView()
                    .progressViewStyle(.circular)
                    .frame(maxWidth: .infinity)
                    
            case .loadedAllPages:
                Color.black
            }
                
            
            
        }
        .listStyle(.plain)
    }
    
}

struct AlbumListView_Previews: PreviewProvider {
    static var previews: some View {
       AlbumListView(viewModel: AlbumListViewModel.sampleVM())
        
    }
}
