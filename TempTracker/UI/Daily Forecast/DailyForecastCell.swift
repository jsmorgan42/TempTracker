//
//  DailyForecastCell.swift
//  TempTracker
//
//  Created by Jesse Morgan on 6/9/20.
//  Copyright © 2020 Jesse Morgan. All rights reserved.
//

import Foundation
import UIKit

class DailyForecastCell: UITableViewCell {
    
    static let identifier = "daily-forecast-cell"
    static let nibName = "DailyForecastCell"
    
    @IBOutlet var dayLabel: UILabel!
    
    @IBOutlet var minTempLabel: UILabel!
    @IBOutlet var maxTempLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
