//
//  HomeWorker.swift
//  unsplash
//
//  Created by Oksana Hanailiuk on 4/2/18.
//  Copyright © 2018 GentleDevs. All rights reserved.
//

import UIKit

protocol HomeWorkerDelegate {
    func response(_ response: Home.Response)
}

class HomeWorker: NSObject {
    var delegate: HomeWorkerDelegate?
    
    func fetchPhotos(_ request: Home.Request) {
        SearchEngine().search(by: request.query) { (response, shouldAppend) in
            let homeResponse = Home.Response(photos: response.photos)
            self.delegate?.response(homeResponse)
        }
    }
}
