//
//  BaseResponse.swift
//  unsplash
//
//  Created by Oksana Hanailiuk on 4/2/18.
//  Copyright © 2018 GentleDevs. All rights reserved.
//

import Foundation
import SwiftyJSON

class BaseResponse: IResponse {
    
    var data: JSON? = nil
    
    var isSuccess: Bool = false
    
    required init(data: Data?) {
        if data != nil {
            self.data = JSON(data!)
        }
    }
}
