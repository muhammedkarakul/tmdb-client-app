//
//  SliderHeaderView.swift
//  TMDB Client App
//
//  Created by Muhammed Karakul on 27.12.2021.
//

import UIKit

final class SliderHeaderView: UITableViewHeaderFooterView {
    var numberOfPages: Int = .zero {
        didSet {
            pageControl.numberOfPages = numberOfPages
        }
    }
    
    // MARK: - UI
    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.isUserInteractionEnabled = false
        return pageControl
    }()
    
    private lazy var collectionViewFlowLayout: UICollectionViewFlowLayout = {
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.itemSize = frame.size
        collectionViewFlowLayout.scrollDirection = .horizontal
        collectionViewFlowLayout.minimumLineSpacing = .zero
        return collectionViewFlowLayout
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.register(NowPlayingMovieCollectionViewCell.self, forCellWithReuseIdentifier: "NowPlayingMovieCollectionViewCell")
        return collectionView
    }()
    
    // MARK: - Setup
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.addSubview(pageControl)
        pageControl.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    func setCollectionViewDelegate(_ delegate: UICollectionViewDelegate, andDataSource dataSource: UICollectionViewDataSource) {
        collectionView.delegate = delegate
        collectionView.dataSource = dataSource
    }
    
    func reloadData() {
        collectionView.reloadData()
    }
}
