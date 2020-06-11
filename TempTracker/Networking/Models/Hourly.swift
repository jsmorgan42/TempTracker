//
//  Hourly.swift
//  TempTracker
//
//  Created by Jesse Morgan on 6/10/20.
//  Copyright © 2020 Jesse Morgan. All rights reserved.
//

import Foundation

struct Hourly: Codable {
    let dt: Int
    let temp: Double
    let feelsLike: Double
    let pressure: Int
    let humidity: Int
    let dewPoint: Double
    let clouds: Int?
    let windSpeed: Double
    let winDeg: Int
    let weather: [Weather]?
    
    enum CodingKeys: String, CodingKey {
        case dt, temp, pressure, humidity, clouds, weather
        case feelsLike = "feels_like"
        case dewPoint = "dew_point"
        case windSpeed = "wind_speed"
        case winDeg = "wind_deg"
    }
}
