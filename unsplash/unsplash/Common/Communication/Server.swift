//
//  Server.swift
//  unsplash
//
//  Created by Oksana Hanailiuk on 4/2/18.
//  Copyright © 2018 GentleDevs. All rights reserved.
//

import Alamofire
import Foundation

class Server: NSObject {
    
    private override init() { }
    static let sharedServer = Server()
    
    func sendRequest(_ request: IRequest, responseHandler: @escaping (_ response: IResponse) -> Void) {
        NSLog("Sending request: \(request.endpoint)")
        let sessionManager = Alamofire.SessionManager.default
        sessionManager.adapter = HeadersAdapter()
        sessionManager.request(request.endpoint, method: request.httpMethod, parameters: request.parameters(), encoding: request.encoding, headers: request.httpHeaders()).responseJSON { response in
            self.handleResponse(request, response: response, responseHandler: responseHandler)
        }
    }
    
    // MARK: Private
    
    private func handleResponse(_ request: IRequest, response: DataResponse<Any>, responseHandler: (_ response: IResponse) -> Void) {
        NSLog("Received response from \(request.endpoint)")
        
        let serverResponse = BaseResponse(data: response.data)
        let statusCode = response.response?.statusCode
        if statusCode == HttpResponseCode.statusOk.rawValue {
            // TODO: handle specific behaviour related to success responses
        } else if statusCode == HttpResponseCode.statusUnauthorized.rawValue {
            // TODO: refresh server communication token
        } else {
            // TODO: handle http errors
        }
        
        serverResponse.isSuccess = (statusCode == HttpResponseCode.statusOk.rawValue)
        responseHandler(serverResponse)
    }
}

