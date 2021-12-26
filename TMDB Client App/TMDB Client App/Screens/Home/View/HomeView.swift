//
//  HomeView.swift
//  TMDB Client App
//
//  Created by Muhammed Karakul on 26.12.2021.
//

import UIKit

final class HomeView: TMDBView {
    // MARK: - Properties
    private var tableView = UITableView()
    
    // MARK: Setup
    override func prepareLayout() {
        super.prepareLayout()
        setupTableViewLayout()
    }
    
    // MARK: - Methods
    private func setupTableViewLayout() {
        addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func setTableViewDelegate(_ delegate: UITableViewDelegate, andDataSource dataSource: UITableViewDataSource) {
        tableView.delegate = delegate
        tableView.dataSource = dataSource
    }
}
