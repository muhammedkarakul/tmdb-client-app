//
//  TMDBViewController.swift
//  TMDB Client App
//
//  Created by Muhammed Karakul on 26.12.2021.
//

import UIKit

class TMDBViewController<T: TMDBView>: UIViewController {
    
    // MARK: - Properties
    typealias ViewType = T
    
    var baseView: ViewType {
        guard let aView = view as? ViewType else {
            fatalError("view property has not been initialized yet, or not initialized as \(ViewType.self).")
        }
        return aView
    }
    
    // MARK: - Init
    init() {
        super.init(nibName: nil, bundle: nil)
        linkInteractor()
        configureAppearance()
        prepareLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        view = ViewType.create()
    }
    
    // MARK: - Methods
    func linkInteractor() {}
    
    func configureAppearance() {
        if #available(iOS 13.0, *) {
            view.backgroundColor = .systemBackground
        } else {
            view.backgroundColor = .white
        }
    }
    
    func prepareLayout() {}
}
