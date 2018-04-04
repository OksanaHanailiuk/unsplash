//
//  DetailViewUIInitializer.swift
//  unsplash
//
//  Created by Oksana Hanailiuk on 4/3/18.
//  Copyright © 2018 GentleDevs. All rights reserved.
//

import UIKit

class DetailViewUIInitializer: IInitializer {
    
    private var parentVC: DetailViewController
    
    init(parentVC: DetailViewController) {
        self.parentVC = parentVC
    }
    
    func initialize() {
        addImageView()
    }
    
    //MARK: - private part
    private func addImageView() {
        let imageView = LoadingImageView(frame: parentVC.view.frame)
        imageView.contentMode = .scaleAspectFit
        parentVC.view.addSubview(imageView)
        parentVC.imageView = imageView
    }
}
