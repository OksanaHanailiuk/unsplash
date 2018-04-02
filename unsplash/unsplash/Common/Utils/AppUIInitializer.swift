//
//  AppUIInitializer.swift
//  unsplash
//
//  Created by Oksana Hanailiuk on 4/2/18.
//  Copyright © 2018 GentleDevs. All rights reserved.
//

import UIKit

class AppUIInitializer: IInitializer {
    
    func initialize() {
        let homeVC = HomeViewController()
        //TODO: - configure view with clean arch
        let vc = UINavigationController(rootViewController: homeVC)
        let window = (UIApplication.shared.delegate as? AppDelegate)?.window
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
    }
}
