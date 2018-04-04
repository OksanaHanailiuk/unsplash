//
//  PhotosDelegate.swift
//  unsplash
//
//  Created by Oksana Hanailiuk on 4/2/18.
//  Copyright © 2018 GentleDevs. All rights reserved.
//

import UIKit

class PhotosDelegate: NSObject {

    private weak var repository: PhotosDataRepository?
    
    var loadMorePhotos: (() -> Void)?
    var startScrolling: (() -> Void)?
    var didSelectItem: ((Photo) -> Void)?
    
    // MARK: - Initialization
    init(repository: PhotosDataRepository?) {
        self.repository = repository
    }
}

extension PhotosDelegate: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let photo = repository?.item(at: indexPath.row) else { return }
        didSelectItem?(photo)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let repoCount = repository?.count else { return }
        if indexPath.row == repoCount - 5 {
            loadMorePhotos?()
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        startScrolling?()
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        startScrolling?()
    }
}
