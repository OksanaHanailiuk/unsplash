//
//  PhotoTableViewCell.swift
//  unsplash
//
//  Created by Oksana Hanailiuk on 4/2/18.
//  Copyright © 2018 GentleDevs. All rights reserved.
//

import UIKit
import SnapKit

class PhotoCollectionViewCell: UICollectionViewCell {

    // MARK: - Variables & Constants
    
    private var photoImageView: LoadingImageView?
    
    // MARK: - Reuse logic
    
    class func reuseIdentifier() -> String {
        return String(describing: self)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView?.removeFromSuperview()
        photoImageView = nil
    }
    
    // MARK: - Public view setup
     func setupSubviews(for model: Photo) {
        addPhotoImageView()
        photoImageView?.setup(withRegularURL: model.imageURL)
        clipsToBounds = true
    }
    
    // MARK: - private part
    private func addPhotoImageView() {
        if photoImageView != nil { return }
        photoImageView = LoadingImageView()
        photoImageView?.frame.size = frame.size
        photoImageView?.contentMode = .scaleAspectFill
        if photoImageView != nil {
            addSubview(photoImageView!)
            photoImageView?.snp.makeConstraints({ maker in
                maker.leading.equalToSuperview()
                maker.trailing.equalToSuperview()
                maker.top.equalToSuperview()
                maker.bottom.equalToSuperview()
            })
        }
    }
}
