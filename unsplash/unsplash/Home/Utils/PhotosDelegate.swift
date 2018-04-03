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
    
    // MARK: - Initialization
    init(repository: PhotosDataRepository?) {
        self.repository = repository
    }
}

extension PhotosDelegate: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //TODO: - select item
    }
}

extension PhotosDelegate: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //TODO: correct item resize
        if let height = repository?.item(at: indexPath.row)?.height, let width = repository?.item(at: indexPath.row)?.width {
            return CGSize(width: width/25, height: height/25)
        } else {
            return CGSize(width: collectionView.frame.size.width/2, height: collectionView.frame.size.height/3)
        }
    }
}
