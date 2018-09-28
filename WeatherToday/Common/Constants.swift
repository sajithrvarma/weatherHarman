//
//  Constants.swift
//  WeatherToday
//
//  Created by Sajith Ramavarma on 25/09/18.
//  Copyright © 2018 Applied Materials. All rights reserved.
//

import UIKit
struct Constants {
    
    struct LocationURL {
        private static var apiKey = "&APPID=7f345d99309adac59af482e62e098c6d"
        static var city = "London"
        static var isoCountryCode = "uk"
        static var location: String {
            get{
                let tempLocation = "http://api.openweathermap.org/data/2.5/forecast?q=\(city),\(isoCountryCode)" + apiKey
                return tempLocation.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) ?? tempLocation
            }
        }
        
        
    }
    
}

