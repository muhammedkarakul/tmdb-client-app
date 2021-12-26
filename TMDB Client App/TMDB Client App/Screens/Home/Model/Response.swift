//
//  Response.swift
//  TMDB Client App
//
//  Created by Muhammed Karakul on 26.12.2021.
//

import Foundation

struct Response: Codable {
    let results: [Movie]
}
