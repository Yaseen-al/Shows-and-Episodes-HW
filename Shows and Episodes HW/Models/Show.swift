//
//  Show.swift
//  Shows and Episodes HW
//
//  Created by C4Q on 12/3/17.
//  Copyright © 2017 Quark. All rights reserved.
//

import Foundation
struct Show: Codable {
    let score: Double
    let show: ShowWraper
}
// coing key isn't working
struct ShowWraper: Codable {
    let title: String
    let id: Double
    let genres: [String]
    let rating: RatingWraper
    let network: NetworkWraper?
    let image: ImageWraper?
    enum CodingKeys: String, CodingKey {
        case title = "name"
        case genres
        case rating
        case network
        case image
        case id
    }
}
struct RatingWraper: Codable {
    let average: Double?
}
struct NetworkWraper: Codable {
    let name: String
}
struct ImageWraper: Codable {
    let medium: String?
    let original: String?
}
