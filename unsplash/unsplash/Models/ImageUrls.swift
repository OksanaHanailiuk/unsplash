//
//  ImageUrls.swift
//  unsplash
//
//  Created by Oksana Hanailiuk on 4/3/18.
//  Copyright © 2018 GentleDevs. All rights reserved.
//

import UIKit
import SwiftyJSON

class ImageUrls {
    
    private var rawPath: String?
    private var fullPath: String?
    private var regularPath: String?
    private var smallPath: String?
    private var thumbsPath: String?
    
    var rawUrl: URL? {
        get { return get(from: rawPath) }
    }
    
    var fullUrl: URL? {
        get { return get(from: fullPath) }
    }
    
    var regularUrl: URL? {
        get { return get(from: regularPath) }
    }
    
    var smallUrl: URL? {
        get { return get(from: smallPath) }
    }
    
    var thumbsUrl: URL? {
        get { return get(from: thumbsPath) }
    }
    
    init(json: JSON) {
        fullPath = json[JsonConstants.full].string
        smallPath = json[JsonConstants.small].string
        thumbsPath = json[JsonConstants.thumb].string
        regularPath = json[JsonConstants.results].string
        rawPath = json[JsonConstants.raw].string
    }
    
    private func get(from text: String?) -> URL? {
        if let unwrappedText = text {
            return URL(string: unwrappedText)
        } else {
            return nil
        }
    }
}
