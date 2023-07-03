//
//  AlbumListModel.swift
//  iTunesCloneSwiftUI
//
//  Created by Krishna on 03/07/23.
//

import Foundation


// MARK: - Album
struct Album: Codable {
    let resultCount: Int
    let results: [AlbumItem]
}

// MARK: - Result
struct AlbumItem: Codable, Identifiable {
    let id: Int?
    let wrapperType, kind: String?
    let trackID : Int?
    let artistName, collectionName, trackName, collectionCensoredName: String?
    let trackCensoredName: String?
    let collectionArtistID: Int?
    let collectionArtistViewURL: String?
    let collectionViewURL, trackViewURL: String?
    let previewURL: String?
    let artworkUrl30, artworkUrl60, artworkUrl100: String?
    let collectionPrice, trackPrice: Double?
    let trackRentalPrice, collectionHDPrice, trackHDPrice, trackHDRentalPrice: Double?
    let releaseDate: String?
    let collectionExplicitness, trackExplicitness: String?
    let discCount, discNumber, trackCount, trackNumber: Int?
    let trackTimeMillis: Int?
    let country, currency, primaryGenreName: String?
    let contentAdvisoryRating, shortDescription, longDescription: String?
    let hasITunesExtras: Bool?
    let artistID: Int?
    let artistViewURL: String?
    let isStreamable: Bool?
    
   

    enum CodingKeys: String, CodingKey {
        case wrapperType, kind
  
//        case uuid
        case id = "collectionId"
        case trackID = "trackId"
        case artistName, collectionName, trackName, collectionCensoredName, trackCensoredName
        case collectionArtistID = "collectionArtistId"
        case collectionArtistViewURL = "collectionArtistViewUrl"
        case collectionViewURL = "collectionViewUrl"
        case trackViewURL = "trackViewUrl"
        case previewURL = "previewUrl"
        case artworkUrl30, artworkUrl60, artworkUrl100, collectionPrice, trackPrice, trackRentalPrice
        case collectionHDPrice = "collectionHdPrice"
        case trackHDPrice = "trackHdPrice"
        case trackHDRentalPrice = "trackHdRentalPrice"
        case releaseDate, collectionExplicitness, trackExplicitness, discCount, discNumber, trackCount, trackNumber, trackTimeMillis, country, currency, primaryGenreName, contentAdvisoryRating, shortDescription, longDescription, hasITunesExtras
        case artistID = "artistId"
        case artistViewURL = "artistViewUrl"
        case isStreamable
    }
    
    static func sampleItem() -> AlbumItem {
        return AlbumItem(id: 129642450, wrapperType: nil, kind: nil, trackID: nil, artistName: "Utopia", collectionName: "Ra", trackName: "What !F", collectionCensoredName: nil, trackCensoredName: nil, collectionArtistID: 5735, collectionArtistViewURL: nil, collectionViewURL: "https://music.apple.com/us/album/ra/129642450?uo=4", trackViewURL: nil, previewURL: nil, artworkUrl30: nil, artworkUrl60: "https://is4-ssl.mzstatic.com/image/thumb/Music/2e/59/35/mzi.wnidufdv.jpg/60x60bb.jpg", artworkUrl100: "https://is4-ssl.mzstatic.com/image/thumb/Music/2e/59/35/mzi.wnidufdv.jpg/100x100bb.jpg", collectionPrice: 9.99, trackPrice: 9.99, trackRentalPrice: 9.99, collectionHDPrice: 9.99, trackHDPrice: 9.99, trackHDRentalPrice: 9.99, releaseDate: "1977-02-04T08:00:00Z", collectionExplicitness: nil, trackExplicitness: nil, discCount: nil, discNumber: nil, trackCount: nil, trackNumber: nil, trackTimeMillis: nil, country: "USA", currency: "USD", primaryGenreName: nil, contentAdvisoryRating: nil, shortDescription: nil, longDescription: nil, hasITunesExtras: nil, artistID: nil, artistViewURL: "https://music.apple.com/us/artist/utopia/1167261914?uo=4", isStreamable: nil)
    }
}

