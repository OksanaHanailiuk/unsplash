//
//  DetailPresenter.swift
//  unsplash
//
//  Created by Oksana Hanailiuk on 4/3/18.
//  Copyright © 2018 GentleDevs. All rights reserved.
//

import UIKit

protocol DetailPresentationLogic {
    func present(_ response: Detail.Response)
}

class DetailPresenter: DetailPresentationLogic {
    
    weak var viewController: DetailDisplayLogic?
    
    //MARK: - inititalizer
    init(viewController: DetailDisplayLogic?) {
        self.viewController = viewController
    }
    
    func present(_ response: Detail.Response) {
        viewController?.display(viewModel: Detail.ViewModel(imageUrl: response.photo?.largeImageURL))
    }
}
