//
//  HomeRouter.swift
//  unsplash
//
//  Created by Oksana Hanailiuk on 4/2/18.
//  Copyright © 2018 GentleDevs. All rights reserved.
//

import UIKit

protocol HomeRoutingLogic {
    func show(_ viewController: UIViewController)
}

class HomeRouter: HomeRoutingLogic {

    weak var viewController: HomeViewController?
    
    //MARK: - inititalizer
    init(viewController: HomeViewController?) {
        self.viewController = viewController
    }
    
    func show(_ viewController: UIViewController) {
        
    }
}
