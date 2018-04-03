//
//  HomeModels.swift
//  unsplash
//
//  Created by Oksana Hanailiuk on 4/2/18.
//  Copyright © 2018 GentleDevs. All rights reserved.
//

import UIKit

enum Home {
    
    struct Request {
        let query: String
    }
    
    struct Response {
        var shouldAppend: Bool
        var photos: [Photo]
    }
    
    struct ViewModel {
        struct DisplayedPhoto {
            var id: String?
            var height: Int?
            var width: Int?
            var url: URL?
        }
        var shouldAppend: Bool
        var displayedPhotos: [DisplayedPhoto]
    }
}
