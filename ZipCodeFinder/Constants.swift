//
//  Constants.swift
//  ZipCodeFinder
//
//  Created by Del Edwards on 1/12/22.
//

import Foundation

struct Constants {
    static let baseUrl = "https://www.zipcodeapi.com/rest"
    
    struct Parameters {
        static let key = "OD4r62CydEbu3V1eb713Yy4pKCql99X0vodjQlZh5FAW9WfXC4IG4PgI4Wyjrh8J"
        static let zip = ""
        static let distance = ""
    }
    
    enum HttpHeaderField: String {
        case authentication = "Authorization"
        case contentType = "Content-Type"
        case acceptType = "Accept"
        case acceptEncoding = "Accept-Encoding"
    }
    
    enum ContentType: String {
        case json = "application/json"
    }
}


