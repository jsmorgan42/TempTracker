//
//  Daily.swift
//  TempTracker
//
//  Created by Jesse Morgan on 6/10/20.
//  Copyright © 2020 Jesse Morgan. All rights reserved.
//

import Foundation

struct Daily: Codable {
    let dt: Int
    let sunrise: Int
    let sunset: Int
    let temp: Temp
    let feelsLike: FeelsLike
    let pressure: Int
    let humidity: Int
    let dewPoint: Double
    let uvi: Double
    let clouds: Int?
    let windSpeed: Double
    let winDeg: Int
    let weather: Weather?
    
    enum CodingKeys: String, CodingKey {
        case dt, sunrise, sunset, temp, pressure, humidity, uvi, clouds, weather
        case feelsLike = "feels_like"
        case dewPoint = "dew_point"
        case windSpeed = "wind_speed"
        case winDeg = "wind_deg"
    }
}

struct Temp: Codable {
    let day: Double
    let min: Double
    let max: Double
    let night: Double
    let eve: Double
    let morn: Double
}

struct FeelsLike: Codable {
    let day: Double
    let night: Double
    let eve: Double
    let morn: Double
}
