//
//  HomeViewModel.swift
//  TMDB Client App
//
//  Created by Muhammed Karakul on 26.12.2021.
//

import Foundation

final class HomeViewModel: TMDBViewModel {
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
    
    // MARK: - Methods
    func configureSliderTableViewCell(_ cell: SliderTableViewCell) {
        cell.numberOfPages = nowPlayingMovies.count
        nowPlayingMovies.enumerated().forEach { index, nowPlayingMovie in
            cell.sliderViews[index].imageView.kf.setImage(with: nowPlayingMovie.posterURL)
            cell.sliderViews[index].title = nowPlayingMovie.title
            cell.sliderViews[index].overview = nowPlayingMovie.overview
        }
    }
    
    func configureMovieTableViewCell(_ cell: MovieTableViewCell, forIndexPath indexPath: IndexPath) {
        let upcomingMovie = upcomingMovies[indexPath.row]
        cell.thumbnailImageView.kf.setImage(with: upcomingMovie.posterURL)
        if let year = upcomingMovie.getDateComponent(.year) {
            cell.title = "\(upcomingMovie.title)(\(year))"
        } else {
            cell.title = upcomingMovie.title
        }
        cell.subtitle = upcomingMovie.overview
        
        if let dateWithDotNotation = upcomingMovie.dateWithDotNotation {
            cell.date = dateWithDotNotation
        } else {
            cell.date = upcomingMovie.releaseDate
        }
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
    
    func fetchNowPlayingMovies(completion: @escaping (Error?) -> Void) {
        provider.request(.nowPlaying) { result in
            if let error = result.error {
                completion(error)
                return
            }
            do {
                guard let data = result.value?.data else { return }
                let nowPlayingMovieResponse = try JSONDecoder().decode(NowPlayingMovieResponse.self, from: data)
                self.nowPlayingMovies = nowPlayingMovieResponse.results
                completion(nil)
            } catch {
                completion(error)
            }
        }
    }
}
