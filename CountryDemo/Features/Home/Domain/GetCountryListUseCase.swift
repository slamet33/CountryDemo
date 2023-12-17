//
//  GetCountryListUseCase.swift
//  CountryDemo
//
//  Created by Slamet on 17/12/23.
//

import Foundation

class GetCountryListUseCase {
    let repository: CountryRepositoryProtocol
    
    init(repository: CountryRepository) {
        self.repository = repository
    }
    
    func execute() async throws -> [CountryEntity] {
        return try await repository.fetchCountries()
    }
}
