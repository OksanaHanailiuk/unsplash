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
    var router: (NSObjectProtocol & HomeRoutingLogic & HomeDataPassing)?

    var photosCollectionView: UICollectionView?
    
    private var defaultQuery = "unsplash"
    
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
        let delegate = PhotosDelegate(repository: dataRepository)
        delegate.loadMorePhotos = loadMorePhotosAction
        delegate.startScrolling = startScrollingAction
        delegate.didSelectItem = didSelectItem
        return delegate
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiInititalizer.initialize()
       
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.searchBar.becomeFirstResponder()
        }
        addDefaultSearch()
        
        if traitCollection.forceTouchCapability == .available {
            registerForPreviewing(with: self, sourceView: view)
        }
    }
    
    private func addDefaultSearch() {
        searchBar.text = defaultQuery
        let request = Home.Request(query: defaultQuery)
        interactor?.process(request)
    }
    
    //MARK: - actions
    lazy var loadMorePhotosAction: () -> Void = { [weak self] in
        if let searchText = self?.searchBar.text {
            let request = Home.Request(query: searchText)
            self?.interactor?.process(request)
        }
    }
    
    lazy var startScrollingAction: () -> Void = { [weak self] in
        self?.searchBar.resignFirstResponder()
    }
    
    lazy var didSelectItem: (Photo) -> Void = { [weak self] photoItem in
        self?.searchBar.resignFirstResponder()
        self?.router?.dataPassing = photoItem
        self?.router?.routeToDetailVC()
    }
}

extension HomeViewController: HomeDisplayLogic {
    func display(viewModel: Home.ViewModel) {
        if viewModel.shouldAppend {
            let photos = viewModel.displayedPhotos
            if photos.count != 0 {
                dataRepository.append(viewModel.displayedPhotos)
            }
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
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

extension HomeViewController: PortraitLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
        let height = dataRepository.item(at: indexPath.row)?.height
        let width = dataRepository.item(at: indexPath.row)?.width
        return uiInititalizer.calculateHeight(with: height, and: width)
    }
}

extension HomeViewController: UIViewControllerPreviewingDelegate {
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        guard let locationCell: CGPoint = photosCollectionView?.convert(location, from: view) else { return nil }
        guard let indexPath = photosCollectionView?.indexPathForItem(at: locationCell) else { return nil }
        guard let photoItem = dataRepository.item(at: indexPath.row) else { return nil }
        
        searchBar.resignFirstResponder()
        router?.dataPassing = photoItem
        return router?.detailVC
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        show(viewControllerToCommit, sender: self)
    }
}
