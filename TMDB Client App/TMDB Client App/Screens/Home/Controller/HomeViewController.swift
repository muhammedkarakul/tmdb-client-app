//
//  HomeViewController.swift
//  TMDB Client App
//
//  Created by Muhammed Karakul on 26.12.2021.
//

import UIKit

final class HomeViewController: TMDBViewController<HomeView> {
    // MARK: - Lifecycle
    override func configureAppearance() {
        super.configureAppearance()
        baseView.backgroundColor = .systemBlue
    }
}
