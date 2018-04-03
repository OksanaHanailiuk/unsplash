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
    static let searchPhotos: String = "/search/photos"
}

enum HttpResponseCode: Int {
    case statusOk = 200
    case statusUnauthorized = 401
    case statusForbidded = 403
}

struct Parameter {
    static let query = "query"
    static let perPage = "per_page"
    static let page = "page"
}

struct JsonConstants {
    static let results = "results"
    static let total = "total"
    static let totalPages = "total_pages"
    static let width = "width"
    static let height = "height"
    static let urls = "urls"
    static let id = "id"
    static let full = "full"
    static let small = "small"
    static let thumb = "thumb"
    static let regular = "regular"
    static let raw = "raw"
}

struct HeaderKeys {
    static let auth = "Authorization"
    static let version = "Accept-Version"
}

struct HeaderValues {
    static let auth = "Client-ID 871e5744ef933100c3c75ac273ce0f0d8abc7b3abe1c11726fbed6ce5f81f7f8"
    static let version = "v1"
}
