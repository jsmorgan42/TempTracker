//
//  ViewModel.swift
//  TempTracker
//
//  Created by Jesse Morgan on 6/11/20.
//  Copyright © 2020 Jesse Morgan. All rights reserved.
//

import Foundation

final class ViewModel {
    static var location: Location = Location()
    
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
