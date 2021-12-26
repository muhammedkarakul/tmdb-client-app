//
//  UpcomingMovie.swift
//  TMDB Client App
//
//  Created by Muhammed Karakul on 26.12.2021.
//

import Foundation

struct UpcomingMovie: Codable {
    let id: Int
    let title: String
    let overview: String
    let releaseDate: String
    let posterPath: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case title
        case overview
        case releaseDate = "release_date"
        case posterPath = "poster_path"
    }
}

extension UpcomingMovie {
    var posterURL: URL? {
        URL(string: "https://image.tmdb.org/t/p/original\(posterPath)")
    }
}
