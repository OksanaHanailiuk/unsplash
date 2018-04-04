//
//  PhotosDataRepository.swift
//  unsplash
//
//  Created by Oksana Hanailiuk on 4/2/18.
//  Copyright © 2018 GentleDevs. All rights reserved.
//

import UIKit

class PhotosDataRepository {
    
    private var photos: [Photo] = []
    
    var dispayedPhotos: [Photo] = [] {
        didSet {
            photos = dispayedPhotos
        }
    }
    
    var count: Int {
        return photos.count
    }
    
    func item(at index: Int) -> Photo? {
        if index >= 0 && index < photos.count {
            return photos[index]
        }
        return nil
    }
    
    func replace(with array: [Photo]?) {
        guard let unwrappedArray = array else { return }
        photos = unwrappedArray
    }
    
    func append(_ array: [Photo]?) {
        guard let unwrappedArray = array else { return }
        photos.append(contentsOf: unwrappedArray)
    }
}
