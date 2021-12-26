//
//  HomeView.swift
//  TMDB Client App
//
//  Created by Muhammed Karakul on 26.12.2021.
//

import UIKit

protocol HomeViewDelegate: AnyObject {
    func homeView(_ view: HomeView, didSelectRowAtIndexPath indexPath: IndexPath)
}

final class HomeView: TMDBView {
    // MARK: - Properties
    weak var delegate: HomeViewDelegate?
    
    private lazy var tapGestureRecognizer: UITapGestureRecognizer = {
        UITapGestureRecognizer(target: self, action: #selector(didTapGestureRecognized(_:)))
    }()
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.bounces = false
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        }
        tableView.showsHorizontalScrollIndicator = false
        tableView.showsVerticalScrollIndicator = false
        tableView.allowsSelection = true
        return tableView
    }()
    
    // MARK: Setup
    override func linkInteractor() {
        super.linkInteractor()
        tableView.register(UpcomingMovieTableViewCell.self, forCellReuseIdentifier: "UpcomingMovieTableViewCell")
        tableView.register(SliderTableViewCell.self, forCellReuseIdentifier: "SliderTableViewCell")
        tableView.addGestureRecognizer(tapGestureRecognizer)
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
    
    var sliderTableViewCell: SliderTableViewCell? {
        tableView.cellForRow(at: IndexPath(row: .zero, section: .zero)) as? SliderTableViewCell
    }
    
    @objc
    private func didTapGestureRecognized(_ sender: UITapGestureRecognizer) {
        let location = tapGestureRecognizer.location(in: tableView)
        guard let indexPath = tableView.indexPathForRow(at: location) else { return }
        delegate?.homeView(self, didSelectRowAtIndexPath: indexPath)
    }
}
