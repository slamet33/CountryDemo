//
//  CountryRepositoryProtocol.swift
//  CountryDemo
//
//  Created by Slamet on 17/12/23.
//

import Foundation

protocol CountryRepositoryProtocol {
    func fetchCountries() async throws -> [CountryEntity]
}
