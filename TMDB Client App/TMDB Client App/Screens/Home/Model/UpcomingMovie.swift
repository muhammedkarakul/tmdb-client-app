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
    
    private var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter
    }
    
    private var date: Date? {
        return dateFormatter.date(from: releaseDate)
    }
    
    var dateWithDotNotation: String? {
        dateFormatter.dateFormat = "dd.MM.yyyy"
        guard let date = date else { return nil }
        return dateFormatter.string(from: date)
    }
    
    func getDateComponent(_ component: DateComponent) -> String? {
        guard let date = date else { return nil }
        let calendar = Calendar.current.dateComponents([.day, .year, .month], from: date)
        
        switch component {
        case .day:
            guard let day = calendar.day else { return nil }
            return "\(day)"
        case .month:
            guard let month = calendar.month else { return nil }
            return "\(month)"
        case .year:
            guard let year = calendar.year else { return nil }
            return "\(year)"
        }
    }
    
    enum DateComponent {
        case day
        case month
        case year
    }

}
