//
//  Current.swift
//  TempTracker
//
//  Created by Jesse Morgan on 6/10/20.
//  Copyright © 2020 Jesse Morgan. All rights reserved.
//

import Foundation

struct CurrentOverview: Codable {
    let lat: Double
    let lon: Double
    let timezone: String
    let timezoneOffset: Int
    
    enum CodingKeys: String, CodingKey {
        case lat, lon, timezone
        case timezoneOffset = "timezone_offset"
    }
}

struct Current: Codable {
    let dt: Int
    let sunrise: Int
    let sunset: Int
    let temp: Double
    let feelsLike: Double
    let pressure: Int
    let humidity: Int
    let dewPoint: Double
    let uvi: Double
    let clouds: Int?
    let visibility: Int
    let windSpeed: Double
    let winDeg: Int
    let weather: [Weather]?
    
    enum CodingKeys: String, CodingKey {
        case dt, sunrise, sunset, temp, pressure, humidity, uvi, clouds, visibility, weather
        case feelsLike = "feels_like"
        case dewPoint = "dew_point"
        case windSpeed = "wind_speed"
        case winDeg = "wind_deg"
    }
}
