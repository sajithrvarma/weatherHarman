//
//  WeatherModel.swift
//  WeatherToday
//
//  Created by Sajith Ramavarma on 25/09/18.
//  Copyright © 2018 Applied Materials. All rights reserved.
//

import UIKit

struct WeatherPredictor: Codable {
    var forecasts: [WeatherDetails]
    
    private enum CodingKeys: String, CodingKey {
        case forecasts = "list"
    }
}

struct WeatherDetails: Codable {
    var temperature: Temperature
    var weather: [Weather]
    var dateString: String
    var time: String {
        return timeStringFromDate(date: date)
    }
    
    var date: Date {
        return dateString.asDate()
    }
    
    private enum CodingKeys: String, CodingKey {
        case weather
        case temperature = "main"
        case dateString = "dt_txt"
    }
}

struct Temperature: Codable {
    var value: Double
    
    private enum CodingKeys: String, CodingKey {
        case value = "temp"
    }
}


struct Weather: Codable, Downloadable {
    var main: String
    var icon: String
    
    func downloadIconImage(completion: @escaping ResultBlock<Data>) {
        
        let iconURLString = "http://openweathermap.org/img/w/\(icon).png"
        
        downloadImageData(withURLString: iconURLString) { result in
            
            switch result {
                
            case .error(message: let msg):
                completion(Result.error(msg))
            case .value(let val):
                completion(Result.value(val))
            }
            
        }
    }
}
