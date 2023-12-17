//
//  CountryResponse.swift
//  CountryDemo
//
//  Created by Slamet on 17/12/23.
//

import Foundation

struct CountryResponse: Codable {
    let data: [Country]
    let msg: String
}

