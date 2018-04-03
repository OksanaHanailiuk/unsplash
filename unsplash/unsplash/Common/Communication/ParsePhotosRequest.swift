//
//  ParsePhotosRequest.swift
//  unsplash
//
//  Created by Oksana Hanailiuk on 4/2/18.
//  Copyright © 2018 GentleDevs. All rights reserved.
//

import UIKit
import SwiftyJSON

class ParsePhotosRequest {
    
    private var json: JSON
    
    init(json: JSON) {
        self.json = json
    }
    
    func execute() -> [Photo] {
        var photos = [Photo]()
        json["results"].arrayValue.forEach { item in
            let imahePath = item["urls"]["thumb"].stringValue
            let photo = Photo(imagePath: imahePath)
            photos.append(photo)
        }
        return photos
    }

}
