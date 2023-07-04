//
//  MovieModel.swift
//  iTunesCloneSwiftUI
//
//  Created by Krishna on 04/07/23.
//

import Foundation



// MARK: - Movie
struct Movie: Codable {
    let resultCount: Int
    let results: [MovieItem]
}

// MARK: - MovieItem
struct MovieItem: Codable, Identifiable {
    let wrapperType: String?
    let kind: String?
    let trackID: Int
    let artistName, trackName, trackCensoredName: String?
    let trackViewURL: String?
    let previewURL: String?
    let artworkUrl30, artworkUrl60, artworkUrl100: String?
    let collectionPrice, trackPrice: Double?
    let trackRentalPrice, collectionHDPrice, trackHDPrice, trackHDRentalPrice: Double?
    let releaseDate: String?
    let collectionExplicitness, trackExplicitness: String?
    let trackTimeMillis: Int?
    let country: String?
    let currency: String?
    let primaryGenreName, contentAdvisoryRating, longDescription: String?
    let shortDescription: String?
    let collectionID: Int?
    let collectionName, collectionCensoredName: String?
    let collectionArtistID: Int?
    let collectionArtistViewURL, collectionViewURL: String?
    let discCount, discNumber, trackCount, trackNumber: Int?
    let hasITunesExtras: Bool?
    
    var id: Int {
        return trackID
    }

    enum CodingKeys: String, CodingKey {
        case wrapperType, kind
        case trackID = "trackId"
        case artistName, trackName, trackCensoredName
        case trackViewURL = "trackViewUrl"
        case previewURL = "previewUrl"
        case artworkUrl30, artworkUrl60, artworkUrl100, collectionPrice, trackPrice, trackRentalPrice
        case collectionHDPrice = "collectionHdPrice"
        case trackHDPrice = "trackHdPrice"
        case trackHDRentalPrice = "trackHdRentalPrice"
        case releaseDate, collectionExplicitness, trackExplicitness, trackTimeMillis, country, currency, primaryGenreName, contentAdvisoryRating, longDescription, shortDescription
        case collectionID = "collectionId"
        case collectionName, collectionCensoredName
        case collectionArtistID = "collectionArtistId"
        case collectionArtistViewURL = "collectionArtistViewUrl"
        case collectionViewURL = "collectionViewUrl"
        case discCount, discNumber, trackCount, trackNumber, hasITunesExtras
    }
    
    static func sampleItem() -> MovieItem {
        return MovieItem(wrapperType: "collection", kind: "album", trackID: 129642450, artistName: "Utopia", trackName: "Ra", trackCensoredName: nil, trackViewURL: nil, previewURL: nil, artworkUrl30: nil, artworkUrl60: "https://is4-ssl.mzstatic.com/image/thumb/Music/2e/59/35/mzi.wnidufdv.jpg/60x60bb.jpg", artworkUrl100: "https://is4-ssl.mzstatic.com/image/thumb/Music/2e/59/35/mzi.wnidufdv.jpg/100x100bb.jpg", collectionPrice: 9.99, trackPrice: nil, trackRentalPrice: nil, collectionHDPrice: nil, trackHDPrice: nil, trackHDRentalPrice: nil, releaseDate: "1977-02-04T08:00:00Z", collectionExplicitness: "explicit", trackExplicitness: nil, trackTimeMillis: nil, country: "USA", currency: "USD", primaryGenreName: "Rock", contentAdvisoryRating: "Explicit", longDescription: nil, shortDescription: nil, collectionID: 129642450, collectionName: "Ra", collectionCensoredName: nil, collectionArtistID: nil, collectionArtistViewURL: nil, collectionViewURL: "https://music.apple.com/us/album/ra/129642450?uo=4", discCount: nil, discNumber: nil, trackCount: 7, trackNumber: nil, hasITunesExtras: nil)
    }
}


/*
 {"wrapperType":"collection", "collectionType":"Album", "artistId":1167261914, "collectionId":129642450, "amgArtistId":5735, "artistName":"Utopia", "collectionName":"Ra", "collectionCensoredName":"Ra", "artistViewUrl":"https://music.apple.com/us/artist/utopia/1167261914?uo=4", "collectionViewUrl":"https://music.apple.com/us/album/ra/129642450?uo=4", "artworkUrl60":"https://is4-ssl.mzstatic.com/image/thumb/Music/2e/59/35/mzi.wnidufdv.jpg/60x60bb.jpg", "artworkUrl100":"https://is4-ssl.mzstatic.com/image/thumb/Music/2e/59/35/mzi.wnidufdv.jpg/100x100bb.jpg", "collectionPrice":9.99, "collectionExplicitness":"explicit", "contentAdvisoryRating":"Explicit", "trackCount":7, "copyright":"℗ 2006 Bearsville Records Inc., produced under license from Bearsville Records Inc., manufactured by Rhino Entertainment Co.", "country":"USA", "currency":"USD", "releaseDate":"1977-02-04T08:00:00Z", "primaryGenreName":"Rock"}
 */
