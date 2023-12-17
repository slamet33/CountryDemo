//
//  CountryRepository.swift
//  CountryDemo
//
//  Created by Slamet on 17/12/23.
//

import Foundation

class CountryRepository: CountryRepositoryProtocol {
    static let shared = CountryRepository()
    
    private let dataSource = CountryDataSource()
    
    func fetchCountries() async throws -> [CountryEntity] {
        let countries = try await dataSource.fetchCountries()

        return countries.data.enumerated().map { index, country in
            return CountryEntity(response: Country(id: index + 1, name: country.name, flag: country.flag))
        }
    }
}
