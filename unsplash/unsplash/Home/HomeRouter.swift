//
//  HomeRouter.swift
//  unsplash
//
//  Created by Oksana Hanailiuk on 4/2/18.
//  Copyright © 2018 GentleDevs. All rights reserved.
//

import UIKit

protocol HomeRoutingLogic {
    func routeToDetailVC()
}

protocol HomeDataPassing {
    var dataPassing: Photo? { get set }
}

class HomeRouter: NSObject, HomeRoutingLogic, HomeDataPassing {

    weak var homeVC: HomeViewController?
    var dataPassing: Photo?
    
    //MARK: - inititalizer
    init(viewController: HomeViewController?) {
        self.homeVC = viewController
    }
    
    func routeToDetailVC() {
        let vc = DetailViewController()
        let presenter = DetailPresenter(viewController: vc)
        let router = DetailRouter(viewController: vc)
        let interactor = DetailInteractor(presenter: presenter)
        interactor.photo = dataPassing
        vc.interactor = interactor
        vc.router = router
        homeVC?.navigationController?.pushViewController(vc, animated: true)
    }
}
