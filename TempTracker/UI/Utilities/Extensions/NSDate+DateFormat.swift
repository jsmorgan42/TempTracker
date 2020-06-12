//
//  NSDate+DateFormat.swift
//  TempTracker
//
//  Created by Jesse Morgan on 6/11/20.
//  Copyright © 2020 Jesse Morgan. All rights reserved.
//

import Foundation

extension NSDate {
    
    func formatDate(dateFormat: String = "ha") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        dateFormatter.timeZone = .current
        return dateFormatter.string(from: self as Date)
    }
    
}
