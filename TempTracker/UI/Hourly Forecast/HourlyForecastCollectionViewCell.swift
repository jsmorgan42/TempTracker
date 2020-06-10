//
//  HourlyForecastCollectionViewCell.swift
//  TempTracker
//
//  Created by Jesse Morgan on 6/8/20.
//  Copyright © 2020 Jesse Morgan. All rights reserved.
//

import Foundation
import UIKit

class HourlyForecastCell: UICollectionViewCell {
    
    static let reuseIndentifier = "hourly-forecast-cell"
    
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var temperatureLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
