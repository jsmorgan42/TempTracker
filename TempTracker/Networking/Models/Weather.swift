//
//  Weather.swift
//  TempTracker
//
//  Created by Jesse Morgan on 6/10/20.
//  Copyright © 2020 Jesse Morgan. All rights reserved.
//

import Foundation

struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}
