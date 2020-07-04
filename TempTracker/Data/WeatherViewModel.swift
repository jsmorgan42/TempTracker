//
//  ViewModel.swift
//  TempTracker
//
//  Created by Jesse Morgan on 6/11/20.
//  Copyright © 2020 Jesse Morgan. All rights reserved.
//

import UIKit

final class WeatherViewModel {
    static var location: Location = Location()
    static var description: Description?
    
    static var current: Current?
    static var minutely: [Minutely]?
    static var hourly: [Hourly]?
    static var daily: [Daily]?
}

struct Location {
    // Defaults to Durham, NC
    let latitude: Double = 35.9940
    let longitude: Double = -78.8986
}

enum Description: String {
    case clear = "Clear"
    case clouds = "Clouds"
    case thunderstorm = "Thunderstorm"
    case rain = "Rain"
    
    var image: UIImage {
        switch self {
        case .clear:
            return UIImage(named: "ClearDay")!
        case .clouds:
            return UIImage(named: "OvercastDay")!
        case .thunderstorm:
            return UIImage(named: "Stormy")!
        case .rain:
            return UIImage(named: "Rainy")!
        }
    }
}
