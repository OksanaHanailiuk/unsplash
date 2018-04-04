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
        
        //navigationItem.backBarButtonItem?.title = " "
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       // navigationItem.backBarButtonItem?.title = " "
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            //self.navigationItem.backBarButtonItem?.title = " "
        }
    }
}

extension DetailViewController: DetailDisplayLogic {
    func display(viewModel: Detail.ViewModel) {
        imageView?.setup(withRegularURL: viewModel.imageUrl, andFullURL: viewModel.largeUrl)
    }
}
