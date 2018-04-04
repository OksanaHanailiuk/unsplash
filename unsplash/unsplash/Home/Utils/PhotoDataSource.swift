//
//  PhotoDataSource.swift
//  unsplash
//
//  Created by Oksana Hanailiuk on 4/2/18.
//  Copyright © 2018 GentleDevs. All rights reserved.
//

import UIKit

class PhotoDataSource: NSObject {
    private weak var repository: PhotosDataRepository?
    
    // MARK: - Initialization
    
    init(repository: PhotosDataRepository?) {
        self.repository = repository
    }
}

extension PhotoDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let count = repository?.count else { return 0 }
        if count == 0 {
            let label = NoResultsLabel(frame: collectionView.bounds)
            label.text = "No Search Results"
            collectionView.backgroundView = label
        } else {
            collectionView.backgroundView = nil
        }
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.reuseIdentifier(), for: indexPath) as? PhotoCollectionViewCell else {
             print("\(#file) at line \(#line): Failed to fetch cell for indexPath \(indexPath)")
            return UICollectionViewCell()
        }
        guard let model = repository?.item(at: indexPath.row) else {
            print("\(#file) at line \(#line): Failed to fetch item for index \(indexPath.row)")
            return UICollectionViewCell()
        }
        cell.setupSubviews(for: model)
        return cell
    }
}
