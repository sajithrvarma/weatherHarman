//
//  Downloadable.swift
//  WeatherToday
//
//  Created by Sajith Ramavarma on 25/09/18.
//  Copyright © 2018 Applied Materials. All rights reserved.

import Foundation

protocol Downloadable { }

extension Downloadable {
  
  func downloadImageData(withURLString urlString: String, completion: @escaping ResultBlock<Data>) {
    
    guard let proceduresURL = URL(string: urlString) else {
      completion(Result.error("Invalid URL"))
      return
    }
    
    let request = URLRequest(url: proceduresURL)
    let session = URLSession.shared
    
    let task = session.dataTask(with: request) { imageData, URLResponse, error in
      
      guard let imageData = imageData else {
        return completion(Result.error("Unable to download image"))
      }
      
      return completion(Result.value(imageData))
      
    }
    task.resume()
  }
  
  func downloadData(withURLString urlString: String, completion: @escaping ResultBlock<Data>) {
    
    guard let proceduresURL = URL(string: urlString) else {
      
      completion(Result.error("Invalid URL"))
      return
    }
    
    let request = URLRequest(url: proceduresURL)
    let session = URLSession.shared
    
    let task = session.dataTask(with: request) { data, URLResponse, error in
      
      guard let data = data else {
        return completion(Result.error("Unable to download data"))
      }
      
      return completion(Result.value(data))
    }
    task.resume()
  }
  
}

