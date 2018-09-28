//
//  Parsable.swift
//  WeatherToday
//
//  Created by Sajith Ramavarma on 25/09/18.
//  Copyright © 2018 Applied Materials. All rights reserved.

import Foundation

protocol Parsable { }

extension Parsable {
  
  func parseJSONData(withForecastData data: Data, completion: ResultBlock<WeatherPredictor>) {
    
    do {
      
      let jsonDecoder = JSONDecoder()
      let forecast = try jsonDecoder.decode(WeatherPredictor.self, from: data)
      
      completion(Result.value(forecast))
      
    }
    catch {
      print("error", error)
      completion(Result.error(error.localizedDescription))
    }
  }
  
}
