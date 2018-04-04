//
//  DetailViewController.swift
//  unsplash
//
//  Created by Oksana Hanailiuk on 4/3/18.
//  Copyright © 2018 GentleDevs. All rights reserved.
//

import UIKit
import Haneke

protocol DetailDisplayLogic: class {
    func display(viewModel: Detail.ViewModel)
}

class DetailViewController: UIViewController {

    var interactor: (DetailBusinessLogic & DetailDataSource)?
    var router: DetailRouterDataPassing?
    
    var imageView: LoadingImageView?
    
    lazy var uiInititalizer: DetailViewUIInitializer = { [unowned self] in
        let initializer = DetailViewUIInitializer(parentVC: self)
        return initializer
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiInititalizer.initialize()
        interactor?.process()
    }
}

extension DetailViewController: DetailDisplayLogic {
    func display(viewModel: Detail.ViewModel) {
        imageView?.setup(with: viewModel.imageUrl)
    }
}
