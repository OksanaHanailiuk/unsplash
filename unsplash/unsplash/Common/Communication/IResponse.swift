//
//  IResponse.swift
//  unsplash
//
//  Created by Oksana Hanailiuk on 4/2/18.
//  Copyright © 2018 GentleDevs. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol IResponse {
    
    var data: JSON? { get }
    
    var isSuccess: Bool { get set }
}
