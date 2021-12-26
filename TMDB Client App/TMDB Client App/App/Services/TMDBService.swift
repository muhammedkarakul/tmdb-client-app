//
//  TMDBService.swift
//  TMDB Client App
//
//  Created by Muhammed Karakul on 25.12.2021.
//

import Foundation
import Moya

enum TMDBService {
    case nowPlaying
    case upcoming
}

// MARK: - TargetType
extension TMDBService: TargetType {
    var baseURL: URL {
        URL(string: "https://api.themoviedb.org/3/movie")!
    }
    
    var path: String {
        switch self {
        case .nowPlaying:
            return "/now_playing"
        case .upcoming:
            return "/upcoming"
        }
    }
    
    var method: Moya.Method {
        .get
    }
    
    var sampleData: Data {
        Data()
    }
    
    var task: Task {
        guard let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String else {
            return .requestPlain
        }
        return .requestParameters(parameters: ["api_key": apiKey], encoding: URLEncoding.queryString)
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
}
