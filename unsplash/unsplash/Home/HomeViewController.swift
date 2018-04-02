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
    
    var photosCollectionView: UICollectionView?
    
    lazy var searchBar: UISearchBar = { [unowned self] in
        let searchBar = UISearchBar()
        searchBar.delegate = self
        return searchBar
    }()
    
    lazy var uiInititalizer: HomeUIInitializer = { [unowned self] in
        let initializer = HomeUIInitializer(parentVC: self)
        return initializer
    }()
    
    lazy var dataRepository: PhotosDataRepository = { [unowned self] in
        let repo = PhotosDataRepository()
        return repo
    }()
    
    lazy var dataSource: PhotoDataSource = { [unowned self] in
        let source = PhotoDataSource(repository: dataRepository)
        return source
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        uiInititalizer.initialize()
        interactor?.process()
    }

}

extension HomeViewController: HomeDisplayLogic {
    func display(viewModel: Home.ViewModel) {
        dataRepository.dispayedPhotos = viewModel.displayedPhotos
        photosCollectionView?.reloadData()
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
