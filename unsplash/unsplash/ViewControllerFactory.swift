//
//  ViewControllerFactory.swift
//  unsplash
//
//  Created by Oksana Hanailiuk on 4/2/18.
//  Copyright © 2018 GentleDevs. All rights reserved.
//

import UIKit

class ViewControllerFactory {
    
    func createHomeViewController() -> UINavigationController {
        let vc = HomeViewController()
        
        let presenter = HomePresenter(viewController: vc)
        let router = HomeRouter(viewController: vc)
        let interactor = HomeInteractor(presenter: presenter)
        vc.interactor = interactor
        vc.router = router
        
        return UINavigationController(rootViewController: vc)
    }
}
