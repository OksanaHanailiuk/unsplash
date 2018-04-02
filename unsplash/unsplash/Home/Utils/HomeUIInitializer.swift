//
//  HomeUIInitializer.swift
//  unsplash
//
//  Created by Oksana Hanailiuk on 4/2/18.
//  Copyright © 2018 GentleDevs. All rights reserved.
//

import UIKit
import SnapKit

class HomeUIInitializer: IInitializer {
    
    private var parentVC: HomeViewController
    
    init(parentVC: HomeViewController) {
        self.parentVC = parentVC
    }
    
    func initialize() {

         parentVC.view.backgroundColor = .white
        
        setupSearchController()
        addCollectionView()

    }
    
    private func setupSearchController() {
//        parentVC.searchController.searchResultsUpdater = parentVC
//        parentVC.searchController.obscuresBackgroundDuringPresentation = false
//        parentVC.searchController.hidesNavigationBarDuringPresentation = false
//        parentVC.searchController.dimsBackgroundDuringPresentation = false
//        parentVC.searchController.searchBar.placeholder = "Search Photos"
//        parentVC.navigationItem.searchController = parentVC.searchController
//        parentVC.definesPresentationContext = true
//
//        parentVC.searchController.searchBar.delegate = parentVC
        parentVC.searchBar.placeholder = "Search Photos"
        parentVC.searchBar.sizeToFit()
        parentVC.navigationItem.titleView = parentVC.searchBar
    }
    
    private func addCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.reuseIdentifier())
        collectionView.backgroundColor = .green
        parentVC.view.addSubview(collectionView)
        var topOffset: CGFloat = 0
        if let navBarFrame = parentVC.navigationController?.navigationBar.frame {
            topOffset = navBarFrame.origin.y + navBarFrame.size.height + 13
        }
        collectionView.snp.makeConstraints { maker in
            maker.leading.equalToSuperview()
            maker.top.equalToSuperview().offset(topOffset)
            maker.trailing.equalToSuperview()
            maker.bottom.equalToSuperview()
        }
    }
}
