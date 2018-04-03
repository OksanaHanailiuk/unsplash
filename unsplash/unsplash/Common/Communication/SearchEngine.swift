//
//  SearchEngine.swift
//  unsplash
//
//  Created by Oksana Hanailiuk on 4/3/18.
//  Copyright © 2018 GentleDevs. All rights reserved.
//

import UIKit
import Alamofire

class SearchEngine {
    
    private var skip: Int = 0
    private var previousQuery = ""
    
    func search(by text: String, completion: @escaping (SearchResponse, Bool) -> Void) {
        
        if text == previousQuery {
            
        }
        
        let searchRequest = SearchRequest(query: text)
        Server.sharedServer.sendRequest(searchRequest) { response in
            if let data = response.data {
                let response = SearchResponse(json: data)
                completion(response, true)
            }
        }
    }
}
