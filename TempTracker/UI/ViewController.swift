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
    
    let semaphore = DispatchSemaphore(value: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getWeatherData()
        _ = semaphore.wait(timeout: DispatchTime.distantFuture)
        setLabels()
    }
    
    private func getWeatherData() {
        WeatherRepository.shared.getWeatherData(latitude: ViewModel.location.latitude, longitude: ViewModel.location.longitude, excluding: [.daily, .minutely]) { (result) in
            switch result {
            case .success(let response):
                ViewModel.current = response.current
                ViewModel.minutely = response.minutely
                ViewModel.hourly = response.hourly
                ViewModel.daily = response.daily
                self.semaphore.signal()
            case .failure(let error):
                print("Failed to retrieve weather data: \(error)")
            }
        }
    }
    
    private func setLabels() {
        guard let current = ViewModel.current else {
            print("Failed to retrieve current from view model")
            return
        }
        let date = NSDate(timeIntervalSince1970: TimeInterval(current.dt)).stringFormat(dateFormat: "h:mm a")
        timeLabel.text = date
        let description = current.weather?[0].description.capitalizingFirstLetter()
        descriptionLabel.text = description
        let temperature = Int(current.temp)
        temperatureLabel.text = "\(temperature)°"
    }
    
    func createGradientLayer() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [UIColor.red.cgColor, UIColor.yellow.cgColor]
        self.view.layer.addSublayer(gradientLayer)
    }


}

