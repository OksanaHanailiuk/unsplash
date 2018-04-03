//
//  IKeyboardController.swift
//  unsplash
//
//  Created by Oksana Hanailiuk on 4/3/18.
//  Copyright © 2018 GentleDevs. All rights reserved.
//

import UIKit

protocol KeyboardControllerDelegate: class {
    func controller(_ controller: IKeyboardController, willShowKeyboardWith height: CGFloat)
    func controller(_ controller: IKeyboardController, willHideKeyboardWith height: CGFloat)
    
    func controller(_ controller: IKeyboardController, willIncreaseHeight delta: CGFloat)
    func controller(_ controller: IKeyboardController, willDecreaseHeight delta: CGFloat)
}

protocol IKeyboardController {
    
    weak var delegate: KeyboardControllerDelegate? { get }
    
    func subscribe(_ delegate: KeyboardControllerDelegate?)
    func unsubscribe()
}

