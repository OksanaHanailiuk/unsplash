//
//  HomeViewController.swift
//  unsplash
//
//  Created by Oksana Hanailiuk on 4/2/18.
//  Copyright © 2018 GentleDevs. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    lazy var uiInititalizer: HomeUIInitializer = { [unowned self] in
        let initializer = HomeUIInitializer(parentVC: self)
        return initializer
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red
        // Do any additional setup after loading the view.
    }

}
