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
    private var searchEngine = SearchEngine()
    
    func fetchPhotos(_ request: Home.Request) {
        searchEngine.search(by: request.query) { (response, shouldAppend) in
            let homeResponse = Home.Response(shouldAppend: shouldAppend, photos: response.photos)
            self.delegate?.response(homeResponse)
        }
    }
}
