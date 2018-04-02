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
        //TODO: - create view model from response
    }
}
