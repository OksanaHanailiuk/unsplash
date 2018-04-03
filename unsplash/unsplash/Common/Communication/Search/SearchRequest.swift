//
//  SearchRequest.swift
//  unsplash
//
//  Created by Oksana Hanailiuk on 4/2/18.
//  Copyright © 2018 GentleDevs. All rights reserved.
//

import UIKit
import Alamofire

class SearchRequest: IRequest {
    
    private var query: String
    private var itemsPerPage: Int?
    private var pageNumber: Int?
    
    init(query: String, itemsPerPage: Int? = nil, pageNumber: Int? = nil) {
        self.query = query
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
        guard let perPage = itemsPerPage, let page = pageNumber else {
            return [Parameter.query: query, "orientation": "portrait"]
        }
        return [Parameter.query: query, Parameter.perPage: perPage, Parameter.page: page]
    }
}
