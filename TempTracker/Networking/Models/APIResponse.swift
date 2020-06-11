//
//  APIResponse.swift
//  TempTracker
//
//  Created by Jesse Morgan on 6/10/20.
//  Copyright © 2020 Jesse Morgan. All rights reserved.
//

import Foundation

struct APIResponse: Codable {
    let lat: Double
    let lon: Double
    let timezone: String
    let timezoneOffset: Int
    let current: Current?
    let minutely: [Minutely]?
    let hourly: [Hourly]?
    let daily: [Daily]?
    
    enum CodingKeys: String, CodingKey {
        case lat, lon, timezone, current, minutely, hourly, daily
        case timezoneOffset = "timezone_offset"
    }
}
