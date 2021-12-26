//
//  TMDBView.swift
//  TMDB Client App
//
//  Created by Muhammed Karakul on 26.12.2021.
//

import UIKit

class TMDBView: UIView {
    
    required init() {
        super.init(frame: .zero)
        linkInteractor()
        configureAppearance()
        prepareLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func linkInteractor() {
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didRecognizeTapGesure(_:))))
    }
    
    func configureAppearance() {}
    
    func prepareLayout() {}
    
    static func create() -> Self {
        let view = Self()
        return view
    }
    
}

// MARK: - Actions
extension TMDBView {
    @objc
    private func didRecognizeTapGesure(_ sender: UITapGestureRecognizer) {
        endEditing(true)
    }
}
