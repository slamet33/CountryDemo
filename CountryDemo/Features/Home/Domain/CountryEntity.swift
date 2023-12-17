//
//  CountryEntity.swift
//  CountryDemo
//
//  Created by Slamet on 17/12/23.
//

import Foundation

struct CountryEntity: Hashable {
    let id: Int
    let name: String
    let flagUrl: String
    
    var imageUrl: URL? {
        return URL(string: "\(flagUrl)")
    }
    
    init(response: Country) {
        self.id = response.id ?? 0
        self.name = response.name
        self.flagUrl = response.flag
    }
}
