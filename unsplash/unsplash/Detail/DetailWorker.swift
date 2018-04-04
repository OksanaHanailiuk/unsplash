//
//  DetailWorker.swift
//  unsplash
//
//  Created by Oksana Hanailiuk on 4/3/18.
//  Copyright © 2018 GentleDevs. All rights reserved.
//

import UIKit

protocol DetailWorkerDelegate {
    func response(_ response: Detail.Response)
}

class DetailWorker: NSObject {
    
    var delegate: DetailWorkerDelegate?
    
    func photoDetail(dataSource: DetailDataSource) {
        let response = Detail.Response(imageUrl: dataSource.photo?.imageURL, largeUrl: dataSource.photo?.largeImageURL)
        delegate?.response(response)
    }
}
