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
    var dataStore: Home.ViewModel.DisplayedPhoto? { get set }
}

class HomeRouter: NSObject, HomeRoutingLogic, HomeDataPassing {

    weak var homeVC: HomeViewController?
    var dataStore: Home.ViewModel.DisplayedPhoto?
    
    //MARK: - inititalizer
    init(viewController: HomeViewController?) {
        self.homeVC = viewController
    }
    
    func routeToDetailVC() {
        let vc = DetailViewController()
        vc.router?.dataStore?.photo = dataStore
        homeVC?.navigationController?.pushViewController(DetailViewController(), animated: true)
    }
}
