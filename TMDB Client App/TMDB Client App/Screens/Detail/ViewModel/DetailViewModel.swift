//
//  DetailViewModel.swift
//  TMDB Client App
//
//  Created by Muhammed Karakul on 26.12.2021.
//

import Foundation

final class DetailViewModel: TMDBViewModel {
    var movie: Movie?
    
    init(movie: Movie) {
        super.init()
        self.movie = movie
    }
    
    func configureDetailView(_ view: DetailView) {
        view.posterImageView.kf.setImage(with: movie?.posterURL)
        view.title = movie?.title
        view.rating = movie?.voteAverage
        view.date = movie?.dateWithDotNotation
        view.overview = movie?.overview
    }
}
