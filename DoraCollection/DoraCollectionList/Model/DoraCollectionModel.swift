//
//  DoraCollectionModel.swift
//  DoraCollection
//
//  Created by Sanjeev on 21/10/21.
//

import Foundation

// MARK: - Welcome
struct DoraCollectionModel: Decodable {
    let requestHash: String
    let requestCached: Bool
    let requestCacheExpiry: Int
    let results: [Result]
    let lastPage: Int

    enum CodingKeys: String, CodingKey {
        case requestHash = "request_hash"
        case requestCached = "request_cached"
        case requestCacheExpiry = "request_cache_expiry"
        case results
        case lastPage = "last_page"
    }
}

// MARK: - Result
struct Result: Decodable {
    let malID: Int
    let url: String
    let imageURL: String
    let title: String
    let airing: Bool
    let synopsis: String
    let type: TypeEnum
    let episodes: Int
    let score: Double
    let members: Int
    let rated: Rated

    enum CodingKeys: String, CodingKey {
        case malID = "mal_id"
        case url
        case imageURL = "image_url"
        case title, airing, synopsis, type, episodes, score
        case members, rated
    }
}

enum Rated: String, Decodable {
    case g = "G"
    case pg = "PG"
}

enum TypeEnum: String, Decodable {
    case movie = "Movie"
    case special = "Special"
    case tv = "TV"
}

