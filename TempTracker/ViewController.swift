//
//  ViewController.swift
//  TempTracker
//
//  Created by Jesse Morgan on 6/7/20.
//  Copyright © 2020 Jesse Morgan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var changeLocationButton: UIButton!
    
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var temperatureLabel: UILabel!
    
    @IBOutlet var weatherSymbol: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

