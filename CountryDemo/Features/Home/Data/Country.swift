//
//  Country.swift
//  CountryDemo
//
//  Created by Slamet on 17/12/23.
//

import Foundation

struct Country: Codable {
    let id: Int?
    let name: String
    let flag: String
    var imageUrl: URL? {
        return URL(string: "\(flag)")
    }
}
