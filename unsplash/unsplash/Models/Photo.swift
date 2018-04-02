//
//  Photo.swift
//  unsplash
//
//  Created by Oksana Hanailiuk on 4/2/18.
//  Copyright © 2018 GentleDevs. All rights reserved.
//

import UIKit

class Photo {
    var imagePath: String?
    
    var url: URL? {
        get {
            if let path = imagePath {
                return URL(string: path)
            } else {
                return nil
            }
        }
    }
    init(imagePath: String) {
        self.imagePath = imagePath
    }
}
