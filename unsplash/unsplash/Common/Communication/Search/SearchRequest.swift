//
//  SearchRequest.swift
//  unsplash
//
//  Created by Oksana Hanailiuk on 4/2/18.
//  Copyright © 2018 GentleDevs. All rights reserved.
//

import UIKit
import Alamofire

enum Orientation {
    case portrait, landscape, squarish
    
    var value: String {
        switch self {
        case .portrait:
            return "portrait"
        case .landscape:
            return "landscape"
        case .squarish:
            return "squarish"
        }
    }
}

class SearchRequest: IRequest {
    private var query: String
    private var itemsPerPage: Int
    private var pageNumber: Int
    
    init(query: String, itemsPerPage: Int = 20, pageNumber: Int = 1) {
        self.query = query
        self.itemsPerPage = itemsPerPage
        self.pageNumber = pageNumber
    }
    
    var httpMethod: HTTPMethod {
        get { return .get }
    }
    
    var type: RequestType {
        get { return .searchPhotos }
    }
    
    var endpoint: String {
        get { return Api.baseUrl + Api.searchPhotos }
    }
    
    var encoding: ParameterEncoding {
        get { return URLEncoding.default }
    }
    
    func httpHeaders() -> HTTPHeaders? {
        return nil
    }
    
    func parameters() -> Parameters? {
        return [Parameter.query: query, Parameter.perPage: itemsPerPage, Parameter.page: pageNumber, Parameter.orientation: Orientation.portrait.value]
    }
}
