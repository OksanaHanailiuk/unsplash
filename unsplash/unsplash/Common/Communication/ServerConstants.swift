//
//  Server.swift
//  unsplash
//
//  Created by Oksana Hanailiuk on 4/2/18.
//  Copyright © 2018 GentleDevs. All rights reserved.
//

import Foundation

struct Api {
    static let baseUrl: String = "https://api.unsplash.com"
    static let photos: String = "/photos"
    static let searchPhotos: String = "/search/photos"
}

enum HttpResponseCode: Int {
    case statusOk = 200
    case statusUnauthorized = 401
    case statusForbidded = 403
}

struct Parameter {
    static let clientId = "client_id"
}

struct JsonConstants {
}

struct HeaderKeys {
    static let auth = "Authorization"
    static let version = "Accept-Version"
}

struct HeaderValues {
    static let auth = "Client-ID 871e5744ef933100c3c75ac273ce0f0d8abc7b3abe1c11726fbed6ce5f81f7f8"
    static let version = "v1"
}
