//
//  WeatherCollectionCell.swift
//  WeatherToday
//
//  Created by Sajith Ramavarma on 25/09/18.
//  Copyright © 2018 Applied Materials. All rights reserved.
//


import UIKit

class WeatherCollectionCell: UICollectionViewCell {
  
  @IBOutlet weak var tempLabel: UILabel!
  @IBOutlet weak var tempImage: UIImageView!
  @IBOutlet weak var timeLabel: UILabel!
  
  func configureCell(withForecast forecast: WeatherDetails?) {
    
    guard let forecast = forecast else { return }
    
    let temp = forecast.temperature.value
    timeLabel?.text = forecast.time
    
    tempLabel?.text = String(format: "%.0f", temp - 273.15) + "°"
    
    forecast.weather[0].downloadIconImage(completion: { result in
      
      switch result {
        
      case .value(let val):
        
        DispatchQueue.main.async {
          self.tempImage.image = UIImage(data: val)
        }
        
      case .error(message: let msg):
        print(msg)
      }
    })
  }
}

