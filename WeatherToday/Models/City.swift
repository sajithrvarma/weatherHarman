//
//  City.swift
//  WeatherToday
//
//  Created by Sajith Ramavarma on 27/09/18.
//  Copyright © 2018 Applied Materials. All rights reserved.
//

import UIKit

struct ResponseData: Decodable {
    var city: [City]
}
struct City : Decodable {
    var name: String?
    var isoCountryCode :String?
    var country: String?
    
    static func loadJson(filename fileName: String) -> [City]? {
    if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode(ResponseData.self, from: data)
            return jsonData.city
        } catch {
            print("error:\(error)")
        }
    }
    return nil
}
}
