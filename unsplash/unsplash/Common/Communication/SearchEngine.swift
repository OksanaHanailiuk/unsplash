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
    
    func search(by text: String, completion: @escaping ([Photo], Bool) -> Void) {
        
        if text == previousQuery {
            
        }
        
        let searchRequest = SearchRequest(query: text)
        Server.sharedServer.sendRequest(searchRequest) { response in
            if let data = response.data {
                let photos = ParsePhotosRequest(json: data).execute()
                completion(photos, true)
            }
        }
    }
    
//    func search(by text: String, completion: @escaping ([EmailReceiver], Bool) -> Void) {
//        guard let token = FeathersManager.Providers.feathersApp.authenticationStorage.accessToken else { return }
//
//        let headers = ["Authorization":"Bearer " + token]
//        var urlParams = ["$search": text]
//
//        if text == previousQuery {
//            urlParams["$skip"] = String(skip)
//        } else {
//            skip = 0
//        }
//
//        Alamofire.request("https://peregrine.hellolucy.io/escontacts", method: .get, parameters: urlParams, encoding: URLEncoding.default, headers: headers).responseJSON(completionHandler: { response in
//
//            if let jsonData = response.data {
//                do {
//                    let json = try JSON(data: jsonData)
//                    if let contacts = json["data"].array {
//                        self.skip += contacts.count
//                        var receivers = [EmailReceiver]()
//                        contacts.forEach({ contact in
//                            let receiverName = contact["name"].string
//                            let receiverEmail = contact["email"].string
//                            let receiverImage = contact["profile_pic"].string
//
//                            let receiver = EmailReceiver(name: receiverName, email: receiverEmail, image: receiverImage, destination: .display)
//                            receivers.append(receiver)
//                        })
//                        if text == self.previousQuery {
//                            completion(receivers, true)
//                        } else {
//                            self.previousQuery = text
//                            completion(receivers, false)
//                        }
//                    }
//                }
//                catch let error as NSError {
//                    print("Load json failed: \(error.localizedDescription)")
//                }
//
//            }
//        })
//    }
}
