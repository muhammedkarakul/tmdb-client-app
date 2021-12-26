//
//  HomeViewController.swift
//  TMDB Client App
//
//  Created by Muhammed Karakul on 26.12.2021.
//

import UIKit

final class HomeViewController: TMDBViewController<HomeView> {
    // MARK: - Properties
    private let viewModel = HomeViewModel()
    
    override var preferredStatusBarStyle: UIStatusBarStyle { .lightContent }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchUpcomingMovies()
        fetchNowPlayingMovies()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    // MARK: - Setup
    override func linkInteractor() {
        super.linkInteractor()
        baseView.setTableViewDelegate(self, andDataSource: self)
        baseView.delegate = self
    }
    
    // MARK: - Methods
    private func fetchUpcomingMovies() {
        viewModel.fetchUpcomingMovies { error in
            if let error = error {
                debugPrint(error.localizedDescription)
                return
            }
            
            self.baseView.reloadData()
        }
    }
    
    private func fetchNowPlayingMovies() {
        viewModel.fetchNowPlayingMovies { error in
            if let error = error {
                debugPrint(error.localizedDescription)
                return
            }
            
            self.baseView.reloadData()
        }
    }
    
    private func presentDetailForMovie(_ movie: Movie) {
        let detailViewModel = DetailViewModel(movie: movie)
        let detailViewController = DetailViewController(viewModel: detailViewModel)
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

// MARK: - UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == .zero {
            return 256.0
        }
        return 136.0
    }
}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == .zero {
            return 1
        }
        return viewModel.numberOfRowsInTable
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == .zero {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SliderTableViewCell", for: indexPath) as! SliderTableViewCell
            cell.delegate = self
            cell.setCollectionViewDelegate(self, andDataSource: self)
            viewModel.configureSliderTableViewCell(cell)
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UpcomingMovieTableViewCell", for: indexPath) as! UpcomingMovieTableViewCell
        viewModel.configureUpcomingMovieTableViewCell(cell, forIndexPath: indexPath)
        return cell
    }
}

// MARK: - HomeViewDelegate
extension HomeViewController: HomeViewDelegate {
    func homeView(_ view: HomeView, didSelectRowAtIndexPath indexPath: IndexPath) {
        if indexPath.section == .zero {
            return
        }
        let movie = viewModel.upcomingMovieForIndexPath(indexPath)
        presentDetailForMovie(movie)
    }
}

// MARK: - UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let sliderTableViewCell =  baseView.sliderTableViewCell else { return }
        sliderTableViewCell.currentPage = indexPath.row
    }
}

// MARK: - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfRowsInCollection
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NowPlayingMovieCollectionViewCell", for: indexPath) as! NowPlayingMovieCollectionViewCell
        viewModel.configureNowPlayingMovieCollectionViewCell(cell, forIndexPath: indexPath)
        return cell
    }
}

// MARK: - SliderTableViewCellDelegate
extension HomeViewController: SliderTableViewCellDelegate {
    func sliderTableViewCell(_ cell: SliderTableViewCell, didSelectRowAtIndexPath indexPath: IndexPath) {
        let movie = viewModel.nowPlayingMovieForPageIndexPath(indexPath)
        presentDetailForMovie(movie)
    }
}
