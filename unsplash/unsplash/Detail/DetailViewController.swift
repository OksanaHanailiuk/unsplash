//
//  DetailViewController.swift
//  unsplash
//
//  Created by Oksana Hanailiuk on 4/3/18.
//  Copyright © 2018 GentleDevs. All rights reserved.
//

import UIKit

protocol DetailDisplayLogic: class {
    func display(viewModel: Detail.ViewModel)
}

class DetailViewController: UIViewController {

    var interactor: DetailBusinessLogic?
    var router: DetailRouterDataPassing?
    
    lazy var uiInititalizer: DetailViewUIInitializer = { [unowned self] in
        let initializer = DetailViewUIInitializer(parentVC: self)
        return initializer
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiInititalizer.initialize()
    }
}

extension DetailViewController: DetailDisplayLogic {
    func display(viewModel: Detail.ViewModel) {
        
    }
}
