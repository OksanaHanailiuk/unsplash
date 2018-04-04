//
//  Photo.swift
//  unsplash
//
//  Created by Oksana Hanailiuk on 4/2/18.
//  Copyright © 2018 GentleDevs. All rights reserved.
//

import UIKit
import SwiftyJSON

class Photo {
    private var _id: String?
    private var _imageURls: ImageUrls?
    private var _width: Int?
    private var _height: Int?
    
    var id: String? {
        get { return _id }
    }
    
    var imageURL: URL? {
        get { return _imageURls?.thumbsUrl }
    }
    
    var largeImageURL: URL? {
        get { return _imageURls?.fullUrl }
    }
    
    var width: Int? {
        get { return _width }
    }
    
    var height: Int? {
        get { return _height }
    }
    
    init(json: JSON) {
        _width = json[JsonConstants.width].int
        _height = json[JsonConstants.height].int
        _imageURls = ImageUrls(json: json[JsonConstants.urls])
        _id = json[JsonConstants.id].string
    }
}
