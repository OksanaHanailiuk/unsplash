//
//  SignatureAdapter.swift
//  unsplash
//
//  Created by Oksana Hanailiuk on 4/2/18.
//  Copyright © 2018 GentleDevs. All rights reserved.
//

import UIKit
import Alamofire

class HeadersAdapter: RequestAdapter {

    func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
        var request = urlRequest
        request.addValue(HeaderValues.version, forHTTPHeaderField: HeaderKeys.version)
        request.addValue(HeaderValues.auth, forHTTPHeaderField: HeaderKeys.auth)
        return request
    }
}
