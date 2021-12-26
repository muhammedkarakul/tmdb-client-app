//
//  TMDBViewModel.swift
//  TMDB Client App
//
//  Created by Muhammed Karakul on 26.12.2021.
//

import Foundation
import Kingfisher
import Moya

class TMDBViewModel {
    internal let provider = MoyaProvider<TMDBService>()
}
