//
//  SliderTableViewCell.swift
//  TMDB Client App
//
//  Created by Muhammed Karakul on 26.12.2021.
//

import UIKit

class SliderTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    var numberOfPages: Int = .zero {
        didSet {
            setupPages()
        }
    }
    
    // MARK: - UI
    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPage = .zero
        pageControl.numberOfPages = numberOfPages
        return pageControl
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isPagingEnabled = true
        scrollView.isScrollEnabled = true
        scrollView.delegate = self
        return scrollView
    }()
    
    private lazy var imageViews = [UIImageView]()
    
    // MARK: - Setup
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        scrollView.addSubview(pageControl)
        pageControl.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    private func setupPages() {
        pageControl.numberOfPages = numberOfPages
        
        for pageIndex in 0..<numberOfPages {
            
            var tempImageViewFrame: CGRect = .zero
            
            tempImageViewFrame.origin.x = scrollView.frame.size.width * CGFloat(pageIndex)
            tempImageViewFrame.size = scrollView.frame.size
            
            let tempImageView = UIImageView(frame: tempImageViewFrame)
            tempImageView.image = Asset.imdbLogo.image
            imageViews.append(tempImageView)
            scrollView.addSubview(tempImageView)
            
            scrollView.contentSize = CGSize(width: (scrollView.frame.size.width * CGFloat(numberOfPages)), height: scrollView.frame.size.height)
        }
    }
}

// MARK: - UIScrollViewDelegate
extension SliderTableViewCell: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
        pageControl.currentPage = Int(pageNumber)
    }
}
