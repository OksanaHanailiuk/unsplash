//
//  PhotosDataRepository.swift
//  unsplash
//
//  Created by Oksana Hanailiuk on 4/2/18.
//  Copyright © 2018 GentleDevs. All rights reserved.
//

import UIKit

class PhotosDataRepository {
    
    private var photos: [Home.ViewModel.DisplayedPhoto] = []
    
    var dispayedPhotos: [Home.ViewModel.DisplayedPhoto] = [] {
        didSet {
            photos = dispayedPhotos
        }
    }
    
    var count: Int {
        return photos.count
    }
    
    func item(at index: Int) -> Home.ViewModel.DisplayedPhoto? {
        if index >= 0 && index < photos.count {
            return photos[index]
        }
        return nil
    }
    
    func replace(with array: [Home.ViewModel.DisplayedPhoto]?) {
        guard let unwrappedArray = array else { return }
        photos = unwrappedArray
    }
    
    func append(_ array: [Home.ViewModel.DisplayedPhoto]?) {
        guard let unwrappedArray = array else { return }
        photos.append(contentsOf: unwrappedArray)
    }
}
