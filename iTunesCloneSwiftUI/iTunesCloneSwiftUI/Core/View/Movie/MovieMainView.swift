//
//  MovieMainView.swift
//  iTunesCloneSwiftUI
//
//  Created by Krishna on 04/07/23.
//

import SwiftUI

struct MovieMainView: View {
    
    @ObservedObject var viewModel: MovieListViewModel
    
    
    var body: some View {
        NavigationView {
            Group{
                if viewModel.searchTearm.isEmpty {
                    PlaceholderSuggestionView(searchTearm: $viewModel.searchTearm)
                }else{
                    MovieListView(viewModel: viewModel)
                }
            }
            .searchable(text: $viewModel.searchTearm)
            
                
        }
    }
}

struct MovieMainView_Previews: PreviewProvider {
    static var previews: some View {
        MovieMainView(viewModel: MovieListViewModel())
    }
}
