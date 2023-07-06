//
//  PriceButtonView.swift
//  iTunesCloneSwiftUI
//
//  Created by Krishna on 06/07/23.
//

import SwiftUI


struct PriceButtonView: View {
    var urlStr : String
    var price: String
    
    var body: some View {
        if let url = URL(string: urlStr) {
            Link(price, destination: url )
                .buttonStyle(PriceButtonStyle())
        }
        
    }
}


struct PriceButtonView_Preview: PreviewProvider {
    static var previews: some View{
        PriceButtonView(urlStr: "https://music.apple.com/us/album/ra/129642450?uo=4", price: "32.35")
    }
}
