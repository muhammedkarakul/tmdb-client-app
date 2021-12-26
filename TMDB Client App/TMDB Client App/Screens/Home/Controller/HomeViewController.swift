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
    
    // MARK: - Setup
    override func linkInteractor() {
        super.linkInteractor()
        baseView.setTableViewDelegate(self, andDataSource: self)
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
}

// MARK: - UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 256.0
        default:
            return 136.0
        }
    }
}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRowsInSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SliderTableViewCell", for: indexPath) as! SliderTableViewCell
            viewModel.configureSliderTableViewCell(cell)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as! MovieTableViewCell
            viewModel.configureMovieTableViewCell(cell, forIndexPath: indexPath)
            return cell
        }
    }
}
