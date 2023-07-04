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
            VStack{
                Text(albumItem.collectionName ?? "")
            }
        }
    }
}

struct AlbumRowView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumRowView(albumItem: AlbumItem.sampleItem())
    }
}
