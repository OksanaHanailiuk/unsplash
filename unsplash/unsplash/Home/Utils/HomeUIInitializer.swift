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
    
    private let defaultCellHeight: CGFloat = 50
    
    init(parentVC: HomeViewController) {
        self.parentVC = parentVC
    }
    
    func initialize() {

        parentVC.view.backgroundColor = .white
        setupBackButton()
        setupSearchController()
        addCollectionView()
    }
    
    func calculateHeight(with height: Int?, and width: Int?) -> CGFloat {
        if let unwrappedHeight = height, let unwrappedWidth = width, let collectionView = parentVC.photosCollectionView {
            let collectionViewContentWidth = collectionView.contentSize.width/2
            let coef = CGFloat(unwrappedWidth)/collectionViewContentWidth
            return CGFloat(CGFloat(unwrappedHeight)/coef)
        }
        return defaultCellHeight
    }
    
    private func setupBackButton() {
        let backItem = UIBarButtonItem()
        backItem.tintColor = .gray
        backItem.title = " "
        parentVC.navigationItem.backBarButtonItem = backItem
    }
    
    private func setupSearchController() {
        parentVC.searchBar.placeholder = "Search Photos"
        parentVC.searchBar.sizeToFit()
        parentVC.searchBar.isTranslucent = true
        parentVC.navigationItem.titleView = parentVC.searchBar
    }
    
    private func addCollectionView() {
        //let layout = UICollectionViewFlowLayout()
        let layout = PortraitLayout()
        layout.delegate = parentVC
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.reuseIdentifier())
        collectionView.backgroundColor = .white
        collectionView.dataSource = parentVC.dataSource
        collectionView.delegate = parentVC.delegate
        collectionView.contentInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        parentVC.view.addSubview(collectionView)
        parentVC.photosCollectionView = collectionView
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
