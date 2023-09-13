//
//  AnimalResponse.swift
//  LazyLoading&Caching
//
//  Created by Maliks on 12/09/2023.
//

import Foundation

struct AnimalResponse: Decodable {
    let errorMessage: String
    let animals: [Animal]
    
    enum CodingKeys: String, CodingKey {
        case animals = "data"
        case errorMessage
    }
}

struct Animal: Decodable {
    let name, image: String
}
