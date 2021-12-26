//
//  HomeViewModel.swift
//  TMDB Client App
//
//  Created by Muhammed Karakul on 26.12.2021.
//

import Foundation

final class HomeViewModel: TMDBViewModel {
    // MARK: - Properties
    private var nowPlayingMovies = [Movie]()
    private var upcomingMovies = [Movie]()
    
    var numberOfRowsInTable: Int {
        upcomingMovies.count
    }
    
    var numberOfRowsInCollection: Int {
        nowPlayingMovies.count
    }
    
    // MARK: - Methods
    
    func configureNowPlayingMovieCollectionViewCell(_ cell: NowPlayingMovieCollectionViewCell, forIndexPath indexPath: IndexPath) {
        let nowPlayingMovie = nowPlayingMovies[indexPath.row]
        cell.imageView.kf.setImage(with: nowPlayingMovie.posterURL)
        cell.title = nowPlayingMovie.titleWithYear
        cell.overview = nowPlayingMovie.overview
    }
    
    func configureSliderTableViewCell(_ cell: SliderTableViewCell) {
        cell.numberOfPages = numberOfRowsInCollection
        cell.reloadData()
    }
    
    func configureUpcomingMovieTableViewCell(_ cell: UpcomingMovieTableViewCell, forIndexPath indexPath: IndexPath) {
        let upcomingMovie = upcomingMovies[indexPath.row]
        cell.selectionStyle = .none
        cell.thumbnailImageView.kf.setImage(with: upcomingMovie.posterURL)
        cell.title = upcomingMovie.titleWithYear
        cell.subtitle = upcomingMovie.overview
        cell.date = upcomingMovie.dateWithDotNotation
    }
    
    func fetchUpcomingMovies(completion: @escaping (Error?) -> Void) {
        provider.request(.upcoming) { result in
            if let error = result.error {
                completion(error)
                return
            }
            do {
                guard let data = result.value?.data else { return }
                let upcomingMovieResponse = try JSONDecoder().decode(Response.self, from: data)
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
                let nowPlayingMovieResponse = try JSONDecoder().decode(Response.self, from: data)
                self.nowPlayingMovies = nowPlayingMovieResponse.results
                completion(nil)
            } catch {
                completion(error)
            }
        }
    }
    
    func upcomingMovieForIndexPath(_ indexPath: IndexPath) -> Movie {
        upcomingMovies[indexPath.row]
    }
    
    func nowPlayingMovieForPageIndexPath(_ indexPath: IndexPath) -> Movie {
        nowPlayingMovies[indexPath.row]
    }
}
