//
//  NavigationButton.swift
//  TempTracker
//
//  Created by Jesse Morgan on 6/9/20.
//  Copyright © 2020 Jesse Morgan. All rights reserved.
//

import Foundation
import UIKit

class NavigationButton: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    private func setup() {
        layer.cornerRadius = 12
        backgroundColor = .link
        setTitleColor(UIColor(named: "OffWhite"), for: .normal)
    }
    
}
