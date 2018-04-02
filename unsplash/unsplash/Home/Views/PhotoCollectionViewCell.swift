//
//  PhotoTableViewCell.swift
//  unsplash
//
//  Created by Oksana Hanailiuk on 4/2/18.
//  Copyright © 2018 GentleDevs. All rights reserved.
//

import UIKit
import SnapKit
import Haneke

class PhotoCollectionViewCell: UICollectionViewCell {

    // MARK: - Variables & Constants
    
    private var photoImageView: UIImageView?
    
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
     func setupSubviews(for model: Home.ViewModel.DisplayedPhoto) {
        addPhotoImageView()
        if let imageUrl = model.url {
            photoImageView?.hnk_setImageFromURL(imageUrl, placeholder: nil, format: nil, failure: { [weak self] error in
                print("Error")
                }, success: { [weak self] image in
                    self?.photoImageView?.image = image
            })
        }
    }
    
    // MARK: - private part
    private func addPhotoImageView() {
        if photoImageView != nil { return }
        photoImageView = UIImageView()
        photoImageView?.backgroundColor = .red
        photoImageView?.frame.size = frame.size
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
