//
//  ApiError.swift
//  iTunesCloneSwiftUI
//
//  Created by Krishna on 03/07/23.
//

import Foundation


enum ApiError: Error, CustomStringConvertible {
    
    
    case badUrl
    case UrlSessionError
    case decodeFailure
    case responseError(Int?)
    case otherError(Error)
    
    var description: String {
        switch self {
            
        case .badUrl:
            return "bad url request"
        case .UrlSessionError:
            return "Error with url session"
        case .decodeFailure:
            return "Decode failure "
        case .responseError(let code):
            return "response status code error \(code)"
        case .otherError(let err):
            return "some random error \(err.localizedDescription)"
        }
    }
}
