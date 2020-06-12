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
    
    static let identifier = "hourly-forecast-cell"
    static let nibName = "HourlyForecastCell"
    
//    let label = UILabel()
    
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var temperatureLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setStyle()
    }
    
    private func setStyle() {
        timeLabel.textColor = .customDarkBlue
        temperatureLabel.textColor = .customDarkestBlue
        temperatureLabel.font = .systemFont(ofSize: 26, weight: .semibold)
    }
    
}
