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
//        configure()
    }
    
//    func configure() {
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.adjustsFontForContentSizeCategory = true
//        contentView.addSubview(label)
//        label.font = UIFont.preferredFont(forTextStyle: .caption1)
//        let inset = CGFloat(10)
//        NSLayoutConstraint.activate([
//            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
//            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
//            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: inset),
//            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -inset)
//            ])
//    }
//
}
