//
//  AlbumListView.swift
//  iTunesCloneSwiftUI
//
//  Created by Krishna on 03/07/23.
//

import SwiftUI

struct AlbumListView: View {
    
    @StateObject var viewModel = AlbumListViewModel()
    
    var body: some View {
        List(viewModel.albumList) { album in
            HStack{
                Text(album.collectionName ?? "")
            }
        }.searchable(text: $viewModel.searchTearm)
    }
    
}

struct AlbumListView_Previews: PreviewProvider {
    static var previews: some View {
       AlbumListView(viewModel: AlbumListViewModel.sampleVM())
        
    }
}
