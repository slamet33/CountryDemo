//
//  NetworkAPI.swift
//  CountryDemo
//
//  Created by Slamet on 17/12/23.
//

import Foundation

class NetworkaAPI {
    static let shared = NetworkaAPI()
    
    func fetch<T: Codable>(from url: URL) async throws -> T {
        var request = URLRequest(url: url)
        request.timeoutInterval = Constants.apiTimeInterval
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
            throw URLError(.badServerResponse)
        }
        
        let decodedData = try JSONDecoder().decode(T.self, from: data)
        
        return decodedData
    }
}
