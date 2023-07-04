//
//  MovieListView.swift
//  iTunesCloneSwiftUI
//
//  Created by Krishna on 04/07/23.
//

import SwiftUI

struct MovieListView: View {
    @ObservedObject var viewModel: MovieListViewModel
    var body: some View {
        List {
            ForEach(viewModel.movieList) { movie in
                 
                Text(movie.trackName ?? "")
            }
        }
        .listStyle(.plain)
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView(viewModel: MovieListViewModel.sampleVM())
    }
}
