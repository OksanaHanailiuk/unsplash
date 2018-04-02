//
//  IRequest.swift
//  unsplash
//
//  Created by Oksana Hanailiuk on 4/2/18.
//  Copyright © 2018 GentleDevs. All rights reserved.
//

import Foundation
import Alamofire

enum RequestType {
    case photos
}

protocol IRequest {
    
    var httpMethod: HTTPMethod { get }
    
    var type: RequestType { get }
    
    var endpoint: String { get }
    
    var encoding: ParameterEncoding { get }
    
    func httpHeaders() -> HTTPHeaders?
    
    func parameters() -> Parameters?
    
}
