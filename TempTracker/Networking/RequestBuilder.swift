//
//  RequestBuilder.swift
//  TempTracker
//
//  Created by Jesse Morgan on 6/10/20.
//  Copyright © 2020 Jesse Morgan. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
    case get
    case post
    case put
    case delete
}

struct RequestBuilder {
    private let scheme = "https"
    private let host = "api.openweathermap.org"
    private let path = "data/2.5/onecall"
    
    private var method: HTTPMethod
    private var params: [URLQueryItem]?
    private var body: Data?

    init(method: HTTPMethod, params: [URLQueryItem]? = nil, body: Data? = nil) {
        self.method = method
        self.params = params
        self.body = body
    }
    
    var urlRequest: URLRequest {
        
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = "/" + path
        components.queryItems = params
        
        guard let url = components.url else {
            preconditionFailure(
                "Invalid URL components: \(components)"
            )
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue.uppercased()
        request.httpBody = body
        print(request.url)
        return request
    }
    
}
