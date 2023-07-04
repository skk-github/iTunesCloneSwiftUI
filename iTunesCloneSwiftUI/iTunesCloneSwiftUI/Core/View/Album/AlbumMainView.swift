//
//  AlbumMainView.swift
//  iTunesCloneSwiftUI
//
//  Created by Krishna on 04/07/23.
//

import SwiftUI

struct AlbumMainView: View {
    @StateObject var viewModel = AlbumListViewModel()
    var body: some View {
        Group{
            if viewModel.searchTearm.isEmpty {
                PlaceholderSuggestionView(searchTearm: $viewModel.searchTearm)
            }else{
                AlbumListView(viewModel: viewModel)
            }
        }
        .searchable(text: $viewModel.searchTearm)
            .listStyle(.plain)
    }
}


struct PlaceholderSuggestionView: View {
    let suggestionList = ["Rush", "Bad girl", "Bad guy", "Scorpions"]
    @Binding var searchTearm: String
    var body: some View {
        VStack(spacing: 28){
            Text("Suggsetions")
                .font(.largeTitle)
            ForEach(suggestionList, id: \.hashValue) { item in
                Button {
                    searchTearm = item
                } label: {
                    Text(item)
                        .font(.title2)
                }

            }
        }
        
    }
}

struct AlbumMainView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumMainView(viewModel: AlbumListViewModel.sampleVM())
    }
}
