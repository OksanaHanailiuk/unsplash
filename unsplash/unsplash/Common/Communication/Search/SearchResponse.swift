//
//  SearchResponse.swift
//  unsplash
//
//  Created by Oksana Hanailiuk on 4/3/18.
//  Copyright © 2018 GentleDevs. All rights reserved.
//

import UIKit
import SwiftyJSON

class SearchResponse {
    private var _total: Int?
    private var _totalPages: Int?
    private var _photos: [Photo] = []
    
    var total: Int? {
        get { return _total }
    }
    
    var totalPages: Int? {
        get { return _totalPages }
    }
    
    var photos: [Photo] {
        get { return _photos }
    }
    
    init(json: JSON) {
        _total = json[JsonConstants.total].int
        _totalPages = json[JsonConstants.totalPages].int
        _photos = parsePhotos(json: json)
    }
    
    private func parsePhotos(json: JSON) -> [Photo] {
        var photos = [Photo]()
        json[JsonConstants.results].arrayValue.forEach { json in
            let photo = Photo(json: json)
            photos.append(photo)
        }
        return photos
    }
}
