//
//  AlbumRowView.swift
//  iTunesCloneSwiftUI
//
//  Created by Krishna on 04/07/23.
//

import SwiftUI

struct AlbumRowView: View {
    
 var albumItem: AlbumItem
    
    var body: some View {
        HStack{
   
            AsyncImage(url: URL(string: "")) { image in
                image.frame(width:100, height: 100)
                    
            } placeholder: {
                Image(systemName: "mountain.2.fill")
                    .frame(width:100, height: 100)
                    .background(Color.gray)
            }

            VStack(alignment:.leading){
                Text(albumItem.collectionName ?? "")
                    .font(.title3)
                Text(albumItem.artistName ?? "")
                    .font(.caption)
                    .foregroundColor(Color.gray)
            }
            Spacer()
            PriceButtonView(urlStr: albumItem.collectionViewURL ?? "", price: "\(albumItem.collectionPrice ?? 0.0)")
        }
        .padding(.horizontal, 5)
        
    }
    
   
}

struct AlbumRowView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumRowView(albumItem: AlbumItem.sampleItem())
    }
}
