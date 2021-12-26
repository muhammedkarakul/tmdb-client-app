//
//  UpcomingMovieResponse.swift
//  TMDB Client App
//
//  Created by Muhammed Karakul on 26.12.2021.
//

import Foundation

struct UpcomingMoviesResponse: Codable {
    let results: [UpcomingMovie]
}
