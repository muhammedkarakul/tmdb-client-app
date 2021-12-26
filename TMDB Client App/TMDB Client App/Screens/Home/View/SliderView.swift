//
//  SliderView.swift
//  TMDB Client App
//
//  Created by Muhammed Karakul on 26.12.2021.
//

import UIKit

final class SliderView: TMDBView {
    // MARK: - Properties
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
    private(set) lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var transparentView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0.1
        view.layer.zPosition = 1
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20.0, weight: .bold)
        label.textColor = .white
        label.layer.zPosition = 2
        return label
    }()
    
    private lazy var overviewLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12.0, weight: .medium)
        label.textColor = .white
        label.numberOfLines = .zero
        label.layer.zPosition = 2
        return label
    }()
    
    // MARK: - Setup
    override func prepareLayout() {
        super.prepareLayout()
        
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        addSubview(transparentView)
        transparentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        addSubview(overviewLabel)
        overviewLabel.snp.makeConstraints { make in
            make.leading.equalTo(16.0)
            make.trailing.equalTo(-16.0)
            make.bottom.equalTo(-40.0)
            make.height.equalTo(32.0)
        }
        
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(16.0)
            make.trailing.equalTo(-16.0)
            make.bottom.equalTo(overviewLabel.snp.top).offset(-8.0)
            make.height.equalTo(24.0)
        }
    }
}
