//
//  WeatherRepository.swift
//  TempTracker
//
//  Created by Jesse Morgan on 6/10/20.
//  Copyright © 2020 Jesse Morgan. All rights reserved.
//

import Foundation

enum WeatherDataType: String {
    case minutely
    case hourly
    case daily
}

class WeatherRepository {
    
    static var shared = WeatherRepository()
    
    private let appID = "a454de18cc7b2a1222eda7dbd7f4d1af"
    
    func getWeatherData(latitude: Double, longitude: Double, excluding: [WeatherDataType], completion: @escaping (Result<Bool, Error>) -> Void) {
        let excludingString = (excluding.map { $0.rawValue }).joined(separator: ",")
        let queryItems = [
            URLQueryItem(name: "lat", value: String(latitude)),
            URLQueryItem(name: "lon", value: String(longitude)),
            URLQueryItem(name: "exclude", value: excludingString),
            URLQueryItem(name: "appid", value: appID)
        ]
        
        let request = Request.get(params: queryItems) { (result) in
            switch result {
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    let response = try decoder.decode(APIResponse.self, from: data)
                } catch (let error) {
                    print(error)
                }
                
                completion(.success(true))
            case .failure(let error):
                completion(.failure(error))
            }
        }
        
        HTTPClient.shared.execute(request)
    }
}
    

