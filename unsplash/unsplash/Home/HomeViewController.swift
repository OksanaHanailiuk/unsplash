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
    
    lazy var delegate: PhotosDelegate = { [unowned self] in
        let source = PhotosDelegate(repository: dataRepository)
        source.loadMorePhotos = loadMorePhotos
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
        searchBar.becomeFirstResponder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        keyboardHandler.subscribe(self)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        keyboardHandler.unsubscribe()
    }
    
    //MARK: - actions
    lazy var loadMorePhotos: () -> Void = { [weak self] in
        if let searchText = self?.searchBar.text {
            let request = Home.Request(query: searchText)
            self?.interactor?.process(request)
        }
    }
}

extension HomeViewController: HomeDisplayLogic {
    func display(viewModel: Home.ViewModel) {
        if viewModel.shouldAppend {
            dataRepository.append(viewModel.displayedPhotos)
        } else {
            dataRepository.dispayedPhotos = viewModel.displayedPhotos
        }
        photosCollectionView?.reloadData()
        photosCollectionView?.collectionViewLayout.invalidateLayout()
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

extension HomeViewController: PortraitLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
        let height = dataRepository.item(at: indexPath.row)?.height
        let width = dataRepository.item(at: indexPath.row)?.width
        return uiInititalizer.calculateHeight(with: height, and: width)
    }
}
