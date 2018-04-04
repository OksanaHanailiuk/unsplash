//
//  LoaderImageView.swift
//  unsplash
//
//  Created by Oksana Hanailiuk on 4/4/18.
//  Copyright © 2018 GentleDevs. All rights reserved.
//

import UIKit
import Haneke

class LoadingImageView: UIImageView {

    private var activityIndicator: UIActivityIndicatorView!
    
    var imageURL: URL?
    
    func setup(with url: URL?) {
        backgroundColor = .white
        showLoading()
        if let imageUrl = url {
            hnk_setImageFromURL(imageUrl, placeholder: nil, format: nil, failure: { [weak self] error in
                print("Error")
                self?.hideLoading()
                }, success: { [weak self] image in
                    self?.image = image
                    self?.hideLoading()
            })
        }
    }
    
    //MARK: - spinner
    
    private func showLoading() {
        if activityIndicator == nil {
            activityIndicator = createActivityIndicator()
        }
        showSpinning()
    }
    
    private func hideLoading() {
        activityIndicator.stopAnimating()
    }
    
    private func createActivityIndicator() -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = .gray
        return activityIndicator
    }
    
    private func showSpinning() {
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        addSubview(activityIndicator)
        centerActivityIndicator()
        activityIndicator.startAnimating()
    }
    
    private func centerActivityIndicator() {
        let xCenterConstraint = NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: activityIndicator, attribute: .centerX, multiplier: 1, constant: 0)
        self.addConstraint(xCenterConstraint)
        
        let yCenterConstraint = NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal, toItem: activityIndicator, attribute: .centerY, multiplier: 1, constant: 0)
        self.addConstraint(yCenterConstraint)
    }
}
