//
//  DailyForecastTableViewController.swift
//  TempTracker
//
//  Created by Jesse Morgan on 6/9/20.
//  Copyright © 2020 Jesse Morgan. All rights reserved.
//

import Foundation
import UIKit

final class DailyForecastTableViewController: UITableViewController {
    
    private func getWeatherData() {
        WeatherRepository.shared.getWeatherData(latitude: WeatherViewModel.location.latitude, longitude: WeatherViewModel.location.longitude, excluding: [.hourly, .minutely]) { (result) in
            switch result {
            case .success(let response):
                WeatherViewModel.daily = response.daily
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print("Failed to retrieve weather data: \(error)")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierachy()
        getWeatherData()
    }
    
    private func setupHierachy() {
        tableView.backgroundColor = .offWhite
        tableView.register(UINib(nibName: DailyForecastCell.nibName, bundle: nil), forCellReuseIdentifier: DailyForecastCell.identifier)
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DailyForecastCell.identifier, for: indexPath)
            as? DailyForecastCell else { fatalError("Failed to create daily forecast cell")
        }
        guard let daily = WeatherViewModel.daily?[indexPath.row] else { return cell }
        cell.dayLabel.text = "Tuesday"
        cell.minTempLabel.text = String(daily.temp.min)
        cell.maxTempLabel.text = String(daily.temp.max)
        return cell
    }
    
}
