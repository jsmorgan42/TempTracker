//
//  APIRequest.swift
//  TempTracker
//
//  Created by Jesse Morgan on 6/10/20.
//  Copyright © 2020 Jesse Morgan. All rights reserved.
//

import Foundation

struct Request {
    let builder: RequestBuilder
    let completion: (Result<Data, Error>) -> Void

    init(builder: RequestBuilder, completion: @escaping (Result<Data, Error>) -> Void) {
        self.builder = builder
        self.completion = completion
    }
}

extension Request {
    
    static func get(params: [URLQueryItem]? = nil, completion: @escaping (Result<Data, Error>) -> Void) -> Request {
        let builder = RequestBuilder(method: .get, params: params, body: nil)
        return Request(builder: builder, completion: completion)
    }
    
}
