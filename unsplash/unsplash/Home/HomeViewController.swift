//
//  HomeViewController.swift
//  unsplash
//
//  Created by Oksana Hanailiuk on 4/2/18.
//  Copyright © 2018 GentleDevs. All rights reserved.
//

import UIKit

protocol HomeDisplayLogic: class {
    func display(viewModel: Home.ViewModel)
}

class HomeViewController: UIViewController {

    var interactor: HomeBusinessLogic?
    var router: HomeRoutingLogic?
    
    let searchController = UISearchController(searchResultsController: nil)
    
    lazy var uiInititalizer: HomeUIInitializer = { [unowned self] in
        let initializer = HomeUIInitializer(parentVC: self)
        return initializer
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        uiInititalizer.initialize()
    }

}

extension HomeViewController: HomeDisplayLogic {
    func display(viewModel: Home.ViewModel) {
        
    }
}

extension HomeViewController: UISearchBarDelegate {
    // MARK: - UISearchBar Delegate
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        
    }
}

extension HomeViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}
