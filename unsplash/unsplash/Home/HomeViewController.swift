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
    
    lazy var keyboardHandler: HomeKeyboardController = { [unowned self] in
        let handler = HomeKeyboardController()
        handler.delegate = self
        return handler
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiInititalizer.initialize()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        keyboardHandler.subscribe(self)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        keyboardHandler.unsubscribe()
    }
}

extension HomeViewController: HomeDisplayLogic {
    func display(viewModel: Home.ViewModel) {
        dataRepository.dispayedPhotos = viewModel.displayedPhotos
        photosCollectionView?.reloadData()
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let request = Home.Request(query: searchText)
        interactor?.process(request)
    }
}

//TODO: - keyboard handling
extension HomeViewController: KeyboardControllerDelegate {
    
    func controller(_ controller: IKeyboardController, willShowKeyboardWith height: CGFloat) {
    }
    
    func controller(_ controller: IKeyboardController, willHideKeyboardWith height: CGFloat) {
    }
    
    func controller(_ controller: IKeyboardController, willIncreaseHeight delta: CGFloat) {
    }
    
    func controller(_ controller: IKeyboardController, willDecreaseHeight delta: CGFloat) {
    }
}
