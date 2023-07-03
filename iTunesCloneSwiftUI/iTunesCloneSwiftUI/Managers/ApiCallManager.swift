//
//  ApiCallManager.swift
//  iTunesCloneSwiftUI
//
//  Created by Krishna on 03/07/23.
//

import Foundation


class ApiCallManager {
    
    
    func fetchRecords<T: Codable>(url: URL?)async throws -> T  {
        
        guard let url = url else {
            throw ApiError.badUrl
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        if let httpResponse = response as? HTTPURLResponse, !(200...299).contains(httpResponse.statusCode) {
            throw ApiError.responseError(httpResponse.statusCode)
        }
        
        do {
            let decodedValue = try JSONDecoder().decode(T.self, from: data)
            return decodedValue
        }catch{
            throw ApiError.decodeFailure
        }
        
        
        
    }
    
    
    
    func genereateUrl(entityType: SearchEntityType, keyword: String?, offset: Int?, limit: Int?) -> URL? {
        let baseUrl = "https://itunes.apple.com/search"
        var urlQuerries = [URLQueryItem(name: "term", value: keyword),URLQueryItem(name: "entity", value: entityType.rawValue)]
        if let offset = offset, let limit = limit {
            urlQuerries.append(contentsOf: [URLQueryItem(name: "offset", value: String(offset)),URLQueryItem(name: "limit", value: String(limit))])
        }
        
        var urlComponents = URLComponents(string: baseUrl)
        urlComponents?.queryItems = urlQuerries
        print("API ALL INITIATEN : \(urlComponents?.url)")
        return urlComponents?.url
        
    }
    
     func generateLookUpUrl(entityType: SearchEntityType, id: Int) -> URL? {
        let baseUrl = "https://itunes.apple.com/lookup"
        var urlComponents = URLComponents(string: baseUrl)
        
        urlComponents?.queryItems = [URLQueryItem(name: "entity", value: entityType.id),URLQueryItem(name: "id", value: String(id))]
        print(urlComponents?.url)
        return urlComponents?.url
        
        
    }
    
    
}
