//
//  PhotoDataSource.swift
//  unsplash
//
//  Created by Oksana Hanailiuk on 4/2/18.
//  Copyright © 2018 GentleDevs. All rights reserved.
//

import UIKit

class PhotoDataSource: NSObject {

}

extension PhotoDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.reuseIdentifier(), for: indexPath) as? PhotoCollectionViewCell else {
             print("\(#file) at line \(#line): Failed to fetch cell for indexPath \(indexPath)")
            return UICollectionViewCell()
        }
        cell.setupSubviews()
        return cell
    }
}
