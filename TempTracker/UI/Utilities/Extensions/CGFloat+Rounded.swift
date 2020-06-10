//
//  CGFloat+Round.swift
//  TempTracker
//
//  Created by Jesse Morgan on 6/9/20.
//  Copyright © 2020 Jesse Morgan. All rights reserved.
//

import Foundation
import UIKit

extension CGFloat {
    
    func roundedDecimals() -> CGFloat {
        return (self * 100).rounded() / 100
    }
    
}
