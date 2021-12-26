//
//  HomeView.swift
//  TMDB Client App
//
//  Created by Muhammed Karakul on 26.12.2021.
//

import UIKit

final class HomeView: TMDBView {
    // MARK: - Properties
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.bounces = false
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        }
        tableView.showsHorizontalScrollIndicator = false
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    // MARK: Setup
    override func linkInteractor() {
        super.linkInteractor()
        tableView.register(SliderTableViewCell.self, forCellReuseIdentifier: "SliderTableViewCell")
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: "MovieTableViewCell")
    }
    
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
    
    func reloadData() {
        tableView.reloadData()
    }
}
