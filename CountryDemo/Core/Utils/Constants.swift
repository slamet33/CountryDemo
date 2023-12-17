//
//  Constants.swift
//  CountryDemo
//
//  Created by Slamet on 17/12/23.
//

import Foundation

struct Constants {
    static let apiURL: String = "https://countriesnow.space/api/v0.1/"
    static let apiTimeInterval: Double = 15.0
    
    enum APIEndpoint {
        case getFlagList
        
        var url: URL? {
            switch self {
            case .getFlagList:
                return URL(string: "\(Constants.apiURL)countries/flag/images")
            }
        }
    }
}
