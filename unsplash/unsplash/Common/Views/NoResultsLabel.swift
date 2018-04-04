//
//  NoResultsLabel.swift
//  unsplash
//
//  Created by Oksana Hanailiuk on 4/4/18.
//  Copyright © 2018 GentleDevs. All rights reserved.
//

import UIKit

class NoResultsLabel: UILabel {
    
    override var text: String? {
        didSet {
            textAlignment = .center
            font = font.withSize(22)
            textColor = UIColor.gray
        }
    }
}
