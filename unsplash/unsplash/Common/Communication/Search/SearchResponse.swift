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
    
    private var json: JSON
    
    var total: Int? {
        get { return json[JsonConstants.total].int }
    }
    
    var totalPages: Int? {
        get { return json[JsonConstants.totalPages].int }
    }
    
    var photos: [Photo] {
        get { return parsePhotos(json: json) }
    }
    
    init(json: JSON) {
        self.json = json
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
