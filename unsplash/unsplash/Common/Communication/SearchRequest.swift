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
        return nil
    }
}
