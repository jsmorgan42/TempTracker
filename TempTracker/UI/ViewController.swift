//
//  ViewController.swift
//  TempTracker
//
//  Created by Jesse Morgan on 6/7/20.
//  Copyright © 2020 Jesse Morgan. All rights reserved.
//

import UIKit
import QuartzCore

final class ViewController: UIViewController {

    @IBOutlet var changeLocationButton: UIButton!
    
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var temperatureLabel: UILabel!
    
    @IBOutlet var weatherSymbol: UIImageView!
    
//    static let semaphore = DispatchSemaphore(value: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getWeatherData()
    }
    
    private func getWeatherData() {
//        WeatherRepository.shared.getWeatherData(latitude: 35.9940, longitude: -78.8986, excluding: [.daily]) { (result) in
//            switch result {
//            case .success(let response):
//                ViewModel.current = response.current
//                ViewModel.minutely = response.minutely
//                ViewModel.hourly = response.hourly
//                ViewModel.daily = response.daily
//                ViewController.semaphore.signal()
//            case .failure(let error):
//                print("Failed to retrieve weather data: \(error)")
//            }
//        }
    }
    
    func createGradientLayer() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [UIColor.red.cgColor, UIColor.yellow.cgColor]
        self.view.layer.addSublayer(gradientLayer)
    }


}

