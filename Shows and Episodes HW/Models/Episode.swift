//
//  Episode.swift
//  Shows and Episodes HW
//
//  Created by C4Q on 12/4/17.
//  Copyright © 2017 Quark. All rights reserved.
//

import Foundation
struct Episode: Codable {
    let id: Int
    let url: String
    let name: String
    let season: Int
    let number: Int
    let airdate: String
    let airtime: String
    let runtime: Int
    let image: EpisodeImageWraper?
    let summary: String?
}
struct EpisodeImageWraper: Codable {
    let medium: String?
    let original: String?
}
