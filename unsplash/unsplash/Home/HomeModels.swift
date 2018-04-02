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
    
    }
    
    struct ViewModel {
        struct DisplayedPhoto {
            var id: String
            var title: String
            var url: URL
        }
        var displayedPhotos: [DisplayedPhoto]
    }
}
