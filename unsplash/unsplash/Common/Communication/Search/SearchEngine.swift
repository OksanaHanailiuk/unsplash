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
    
    private var pageNumber: Int = 1
    private var previousQuery = ""
    
    func search(by text: String, completion: @escaping (SearchResponse, Bool) -> Void) {
        
        if text == previousQuery {
          pageNumber += 1
        } else {
            pageNumber = 1
        }
        
        let searchRequest = SearchRequest(query: text, pageNumber: pageNumber)
        Server.sharedServer.sendRequest(searchRequest) { response in
            if let data = response.data {
                let response = SearchResponse(json: data)
                if text == self.previousQuery {
                    completion(response, true)
                } else {
                    self.previousQuery = text
                    completion(response, false)
                }
            }
        }
    }
}
