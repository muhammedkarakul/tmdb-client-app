//
//  DetailViewController.swift
//  TMDB Client App
//
//  Created by Muhammed Karakul on 26.12.2021.
//

import UIKit

final class DetailViewController: TMDBViewController<DetailView> {
    // MARK: - Properties
    var viewModel: DetailViewModel?
    
    override var preferredStatusBarStyle: UIStatusBarStyle { .default }
    
    // MARK: - Init
    init(viewModel: DetailViewModel) {
        super.init()
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel?.configureDetailView(baseView)
        title = viewModel?.movie?.titleWithYear
    }
}
