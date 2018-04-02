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
    
    func fetchPhotos() {
        let photoRequest = PhotosRequest()
        Server.sharedServer.sendRequest(photoRequest) { (response) in
            print(response)
            if let data = response.data {
                let photos = ParsePhotosRequest(json: data).execute()
                let homeResponse = Home.Response(photos: photos)
                self.delegate?.response(homeResponse)
            }
        }
    }
}
