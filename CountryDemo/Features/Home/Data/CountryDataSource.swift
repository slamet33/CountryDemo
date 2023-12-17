//
//  CountryDataSource.swift
//  CountryDemo
//
//  Created by Slamet on 17/12/23.
//

import Foundation

class CountryDataSource {
    func fetchCountries() async throws -> CountryResponse {
        guard let url: URL = Constants.APIEndpoint.getFlagList.url else { throw URLError(.badURL) }
        return try await NetworkaAPI.shared.fetch(from: url)
    }
}
