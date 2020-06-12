//
//  String+CapitalizeFirstLetter.swift
//  TempTracker
//
//  Created by Jesse Morgan on 6/11/20.
//  Copyright © 2020 Jesse Morgan. All rights reserved.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
