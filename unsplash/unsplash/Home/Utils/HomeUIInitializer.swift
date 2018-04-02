//
//  HomeUIInitializer.swift
//  unsplash
//
//  Created by Oksana Hanailiuk on 4/2/18.
//  Copyright © 2018 GentleDevs. All rights reserved.
//

import UIKit

class HomeUIInitializer: IInitializer {
    
    private var parentVC: HomeViewController
    
    init(parentVC: HomeViewController) {
        self.parentVC = parentVC
    }
    
    func initialize() {
        // Setup the Search Controller
        
        parentVC.navigationController?.navigationBar.barTintColor = .white
        setupSearchController()

    }
    
    private func setupSearchController() {
        parentVC.view.backgroundColor = .white
        parentVC.searchController.searchResultsUpdater = parentVC
        parentVC.searchController.obscuresBackgroundDuringPresentation = false
        parentVC.searchController.hidesNavigationBarDuringPresentation = false
        parentVC.searchController.dimsBackgroundDuringPresentation = false
        parentVC.searchController.searchBar.placeholder = "Search Photos"
        parentVC.navigationItem.searchController = parentVC.searchController
        parentVC.definesPresentationContext = true
        
        parentVC.searchController.searchBar.delegate = parentVC
    }
}
