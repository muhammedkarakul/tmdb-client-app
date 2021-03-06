//
//  UpcomingMovieTableViewCell.swift
//  TMDB Client App
//
//  Created by Muhammed Karakul on 26.12.2021.
//

import UIKit

final class UpcomingMovieTableViewCell: UITableViewCell {
    // MARK: - Properties
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
    var subtitle: String? {
        didSet {
            subtitleLabel.text = subtitle
        }
    }
    
    var date: String? {
        didSet {
            dateLabel.text = date
        }
    }
    
    // MARK: - UI
    private(set) lazy var thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 8.0
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15.0, weight: .bold)
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13.0, weight: .medium)
        if #available(iOS 11.0, *) {
            label.textColor = Asset.textGray.color
        } else {
            label.textColor = .systemGray
        }
        label.numberOfLines = .zero
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12.0, weight: .medium)
        label.textAlignment = .right
        if #available(iOS 11.0, *) {
            label.textColor = Asset.textGray.color
        } else {
            label.textColor = .systemGray
        }
        return label
    }()
    
    private lazy var arrowImageView: UIImageView = {
        let imageView = UIImageView(image: Asset.arrowIcon.image)
        imageView.contentMode = .center
        return imageView
    }()
    
    // MARK: - Setup
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.addSubview(thumbnailImageView)
        thumbnailImageView.snp.makeConstraints { make in
            make.leading.equalTo(16.0)
            make.top.equalTo(16.0)
            make.bottom.equalTo(-16.0)
            make.width.equalTo(104.0)
        }
        
        contentView.addSubview(arrowImageView)
        arrowImageView.snp.makeConstraints { make in
            make.top.equalTo(16.0)
            make.trailing.equalTo(-16.0)
            make.bottom.equalTo(-16.0)
            make.width.equalTo(12.0)
        }
        
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(thumbnailImageView.snp.trailing).offset(8.0)
            make.top.equalTo(24.0)
            make.trailing.equalTo(arrowImageView.snp.leading).offset(-8.0)
            make.height.equalTo(20.0)
        }
        
        contentView.addSubview(subtitleLabel)
        subtitleLabel.snp.makeConstraints { make in
            make.leading.equalTo(thumbnailImageView.snp.trailing).offset(8.0)
            make.top.equalTo(titleLabel.snp.bottom).offset(8.0)
            make.trailing.equalTo(arrowImageView.snp.leading).offset(-8.0)
            make.height.equalTo(36.0)
        }
        
        contentView.addSubview(dateLabel)
        dateLabel.snp.makeConstraints { make in
            make.leading.equalTo(thumbnailImageView.snp.trailing).offset(8.0)
            make.top.equalTo(subtitleLabel.snp.bottom).offset(16.0)
            make.trailing.equalTo(arrowImageView.snp.leading).offset(-8.0)
            make.bottom.equalTo(-16.0)
        }
    }
}
