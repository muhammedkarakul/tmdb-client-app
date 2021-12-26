//
//  HomeViewController.swift
//  TMDB Client App
//
//  Created by Muhammed Karakul on 26.12.2021.
//

import UIKit

final class HomeViewController: TMDBViewController<HomeView> {
    // MARK: - Setup
    override func linkInteractor() {
        baseView.setTableViewDelegate(self, andDataSource: self)
    }
}

// MARK: - UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 256.0
        default:
            return 136.0
        }
    }
}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SliderTableViewCell", for: indexPath) as! SliderTableViewCell
            cell.numberOfPages = 5
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as! MovieTableViewCell
            cell.thumbnailImage = Asset.imdbLogo.image
            cell.title = "title"
            cell.subtitle = "subtitle"
            cell.date = "01.01.2001"
            return cell
        }
    }
}
