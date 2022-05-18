//
//  MovieDetailModel.swift
//  Movies
//
//  Created by Yasa, Tuba Nur on 17.05.2022.
//

import Foundation


struct MovieResponseModel: Codable {
    let page: Int?
    let results: [MovieDetailModel]?
    let allPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case allPages = "totalPages"
        case totalResults
    }
}

struct MovieDetailModel: Codable {
    let adult: Bool?
    let backdropPath: String?
    let genreIDS: [Int]?
    let id: Int?
    let originalLanguage: String?
    let originalTitle, overview: String?
    let popularity: Double?
    let posterPath, releaseDate, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath
        case genreIDS
        case id
        case originalLanguage
        case originalTitle
        case overview, popularity
        case posterPath
        case releaseDate
        case title, video
        case voteAverage
        case voteCount
    }
}
