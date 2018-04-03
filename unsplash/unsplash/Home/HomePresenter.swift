//
//  HomePresenter.swift
//  unsplash
//
//  Created by Oksana Hanailiuk on 4/2/18.
//  Copyright © 2018 GentleDevs. All rights reserved.
//

import UIKit

protocol HomePresentationLogic {
    func present(_ response: Home.Response)
}

class HomePresenter: HomePresentationLogic {
    
    weak var viewController: HomeDisplayLogic?
    
    //MARK: - inititalizer
    init(viewController: HomeDisplayLogic?) {
        self.viewController = viewController
    }
    
    func present(_ response: Home.Response) {
        var displayedPhotos: [Home.ViewModel.DisplayedPhoto] = []
        response.photos.forEach { photo in
            let displayedPhoto = Home.ViewModel.DisplayedPhoto(id: photo.id, height: photo.height, width: photo.width, url: photo.imageURL)
            displayedPhotos.append(displayedPhoto)
        }
        let viewModel = Home.ViewModel(shouldAppend: response.shouldAppend, displayedPhotos: displayedPhotos)
        viewController?.display(viewModel: viewModel)
    }
}
