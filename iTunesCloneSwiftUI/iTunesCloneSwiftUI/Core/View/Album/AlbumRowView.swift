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

            VStack{
                Text(albumItem.collectionName ?? "")
                
            }
            Spacer()
        }
    }
    
    func getImage() -> UIImage {
        guard let imageURL = URL(string: albumItem.artworkUrl100 ?? "") else {
            return UIImage()
        }
        
        Task{
            do{
                let (data, _) = try await URLSession.shared.data(from: imageURL)
                return UIImage(data: data) ?? UIImage()
            }catch{
                return UIImage()
            }
            
        
        }
        return UIImage()
    }
}

struct AlbumRowView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumRowView(albumItem: AlbumItem.sampleItem())
    }
}
