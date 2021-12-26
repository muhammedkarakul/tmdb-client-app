//
//  SliderTableViewCell.swift
//  TMDB Client App
//
//  Created by Muhammed Karakul on 27.12.2021.
//

import UIKit

protocol SliderTableViewCellDelegate: AnyObject {
    func sliderTableViewCell(_ cell: SliderTableViewCell, didSelectRowAtIndexPath indexPath: IndexPath)
}

final class SliderTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    weak var delegate: SliderTableViewCellDelegate?
    
    var currentPage: Int = .zero {
        didSet {
            pageControl.currentPage = currentPage
        }
    }
    
    var numberOfPages: Int = .zero {
        didSet {
            pageControl.numberOfPages = numberOfPages
        }
    }
    
    private lazy var tapGestureRecognizer: UITapGestureRecognizer = {
        UITapGestureRecognizer(target: self, action: #selector(didTapGestureRecognized(_:)))
    }()
    
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
        collectionView.addGestureRecognizer(tapGestureRecognizer)
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
    
    @objc
    private func didTapGestureRecognized(_ sender: UITapGestureRecognizer) {
        let location = tapGestureRecognizer.location(in: collectionView)
        guard let indexPath = collectionView.indexPathForItem(at: location) else { return }
        delegate?.sliderTableViewCell(self, didSelectRowAtIndexPath: indexPath)
    }
}
