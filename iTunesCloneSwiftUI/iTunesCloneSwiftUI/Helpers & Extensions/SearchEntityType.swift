//
//  SearchEntityType.swift
//  iTunesCloneSwiftUI
//
//  Created by Krishna on 03/07/23.
//

import Foundation


enum SearchEntityType: String, CaseIterable, Identifiable {
    var id: String {
        return self.rawValue
    }
    
    case all, album, movie, song
    
    func name() -> String {
        switch self {
            
        case .all:
            return "All"
        case .album:
            return "Album"
        case .movie:
            return "Movie"
        case .song:
            return "Song"
        }
    }
}
