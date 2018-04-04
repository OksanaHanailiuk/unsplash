//
//  DetailRouter.swift
//  unsplash
//
//  Created by Oksana Hanailiuk on 4/3/18.
//  Copyright © 2018 GentleDevs. All rights reserved.
//

import UIKit

protocol DetailRouterDataPassing {
    var dataStore: DetailDataSource? { get set }
}

class DetailRouter: DetailRouterDataPassing {
    
    var dataStore: DetailDataSource?
    weak var detailVC: DetailViewController?
    
    //MARK: - inititalizer
    init(viewController: DetailViewController?) {
        self.detailVC = viewController
    }
}
