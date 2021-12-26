//
//  DetailView.swift
//  TMDB Client App
//
//  Created by Muhammed Karakul on 26.12.2021.
//

import UIKit

final class DetailView: TMDBView {
    var rating: Float? {
        didSet {
            ratingLabel.text = "\(rating ?? .zero)/10"
        }
    }
    
    var date: String? {
        didSet {
            dateLabel.text = date
        }
    }
    
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
    var overview: String? {
        didSet {
            overviewLabel.text = overview
        }
    }
    
    // MARK: - UI
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    private(set) lazy var posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var imdbImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Asset.imdbLogo.image
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var rateImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Asset.rateIcon.image
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var ratingLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13.0, weight: .medium)
        if #available(iOS 11.0, *) {
            label.textColor = Asset.textBlack.color
        }
        return label
    }()
    
    private lazy var dotView: UIView = {
        let view = UIView()
        if #available(iOS 11.0, *) {
            view.backgroundColor = Asset.imdbYellow.color
        } else {
            view.backgroundColor = .systemYellow
        }
        view.layer.cornerRadius = 2.0
        return view
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13.0, weight: .medium)
        if #available(iOS 11.0, *) {
            label.textColor = Asset.textBlack.color
        }
        return label
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20.0, weight: .bold)
        if #available(iOS 11.0, *) {
            label.textColor = Asset.textBlack.color
        }
        return label
    }()
    
    private lazy var overviewLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15.0, weight: .regular)
        if #available(iOS 11.0, *) {
            label.textColor = Asset.textBlack.color
        }
        label.numberOfLines = .zero
        return label
    }()
    
    // MARK: - Setup
    override func prepareLayout() {
        super.prepareLayout()
        
        addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.center.equalToSuperview()
        }
        
        contentView.addSubview(posterImageView)
        posterImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(256.0)
        }
        
        contentView.addSubview(imdbImageView)
        imdbImageView.snp.makeConstraints { make in
            make.leading.equalTo(16.0)
            make.top.equalTo(posterImageView.snp.bottom).offset(16.0)
            make.width.equalTo(49.0)
            make.height.equalTo(24.0)
        }
        
        contentView.addSubview(rateImageView)
        rateImageView.snp.makeConstraints { make in
            make.leading.equalTo(imdbImageView.snp.trailing).offset(8.0)
            make.top.equalTo(posterImageView.snp.bottom).offset(20.0)
            make.width.height.equalTo(16.0)
        }
        
        contentView.addSubview(ratingLabel)
        ratingLabel.snp.makeConstraints { make in
            make.leading.equalTo(rateImageView.snp.trailing).offset(4.0)
            make.top.equalTo(posterImageView.snp.bottom).offset(19.0)
            make.height.equalTo(18.0)
        }
        
        contentView.addSubview(dotView)
        dotView.snp.makeConstraints { make in
            make.leading.equalTo(ratingLabel.snp.trailing).offset(8.0)
            make.top.equalTo(posterImageView.snp.bottom).offset(26.0)
            make.width.height.equalTo(4.0)
        }
        
        contentView.addSubview(dateLabel)
        dateLabel.snp.makeConstraints { make in
            make.leading.equalTo(dotView.snp.trailing).offset(8.0)
            make.top.equalTo(posterImageView.snp.bottom).offset(19.0)
            make.height.equalTo(18.0)
        }
        
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(16.0)
            make.top.equalTo(imdbImageView.snp.bottom).offset(16.0)
            make.trailing.equalTo(-16.0)
            make.height.equalTo(24.0)
        }
        
        contentView.addSubview(overviewLabel)
        overviewLabel.snp.makeConstraints { make in
            make.leading.equalTo(16.0)
            make.top.equalTo(titleLabel.snp.bottom).offset(16.0)
            make.trailing.equalTo(-16.0)
        }
    }
}
