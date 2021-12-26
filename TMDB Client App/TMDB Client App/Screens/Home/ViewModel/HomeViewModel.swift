//
//  HomeViewModel.swift
//  TMDB Client App
//
//  Created by Muhammed Karakul on 26.12.2021.
//

import Foundation
import Kingfisher
import Moya

final class HomeViewModel {
    // MARK: - Properties
    private var nowPlayingMovies = [NowPlayingMovie]()
    private var upcomingMovies = [UpcomingMovie]()
    
    var numberOfSections: Int {
        2
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return upcomingMovies.count
        }
    }
    
    let provider = MoyaProvider<TMDBService>()
    
    // MARK: - Methods
    func configureSliderTableViewCell(_ cell: SliderTableViewCell) {
        cell.numberOfPages = nowPlayingMovies.count
    }
    
    func configureMovieTableViewCell(_ cell: MovieTableViewCell, forIndexPath indexPath: IndexPath) {
        let upcomingMovie = upcomingMovies[indexPath.row]
        cell.thumbnailImageView.kf.setImage(with: upcomingMovie.posterURL)
        cell.title = upcomingMovie.title
        cell.subtitle = upcomingMovie.overview
        cell.date = upcomingMovie.releaseDate
    }
    
    func fetchUpcomingMovies(completion: @escaping (Error?) -> Void) {
        provider.request(.upcoming) { result in
            if let error = result.error {
                completion(error)
                return
            }
            do {
                guard let data = result.value?.data else { return }
                let upcomingMovieResponse = try JSONDecoder().decode(UpcomingMoviesResponse.self, from: data)
                self.upcomingMovies = upcomingMovieResponse.results
                completion(nil)
            } catch {
                completion(error)
            }
        }
    }
}
