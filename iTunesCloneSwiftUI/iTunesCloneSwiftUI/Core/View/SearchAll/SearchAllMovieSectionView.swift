//
//  SearchAllMovieSectionView.swift
//  iTunesCloneSwiftUI
//
//  Created by Krishna on 06/07/23.
//

import SwiftUI

struct SearchAllMovieSectionView: View {
    
    
    var movieList: [MovieItem]
    
    var body: some View {
        
        ScrollView(.horizontal) {
            LazyHStack{
                
                ForEach(movieList){movie in
                    VStack(alignment: .leading){
                        AsyncImage(url: URL(string: movie.artworkUrl100 ?? "")) { image in
                            image
                                .resizable()
                                .frame(width:100,height:100)
                        } placeholder: {
                            ProgressView()
                        }
                        Group{
                            Text(movie.trackName ?? "")
                                .lineLimit(1)
                                
                            Text(movie.primaryGenreName ?? "")
                                .font(.caption)
                        }
                        .frame(width: 100)
                        
                    }
                }
            }
        }
    }
}

struct SearchAllMovieSectionView_Previews: PreviewProvider {
    static var previews: some View {
        SearchAllMovieSectionView(movieList: [MovieItem.sampleItem()])
    }
}
