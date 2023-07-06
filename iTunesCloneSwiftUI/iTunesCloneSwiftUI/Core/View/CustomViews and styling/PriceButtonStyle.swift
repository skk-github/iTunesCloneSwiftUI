//
//  PriceButtonStyle.swift
//  iTunesCloneSwiftUI
//
//  Created by Krishna on 06/07/23.
//

import Foundation
import SwiftUI

struct PriceButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.vertical, 5)
            .padding(.horizontal,10)
            .foregroundColor(Color.red)
            .overlay(RoundedRectangle(cornerRadius: 3).stroke(Color.red,lineWidth: 1 ))
            .opacity(configuration.isPressed ? 0.5 : 1)
    }
}

struct PriceButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button("23.00") {
             
        }
        .buttonStyle(PriceButtonStyle())
    }
}
