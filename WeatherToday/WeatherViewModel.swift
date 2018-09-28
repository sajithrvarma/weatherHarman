//
//  WeatherViewModel.swift
//  WeatherToday
//
//  Created by Sajith Ramavarma on 25/09/18.
//  Copyright © 2018 Applied Materials. All rights reserved.
//

import UIKit

    protocol WeatherViewModelType {
        var forecasts: [[WeatherDetails]]? { get set }
        var dateHeaderText: [String] { get set }
        var cities:[City]{  get }
        func getData( city: City, reloadAction: ((Bool) -> ())?,
                      alertAction: ((String) -> ())?)
        func getCityForName(name: String) -> City?
    }
    
class WeatherViewModel: WeatherViewModelType, Downloadable, Parsable {
    var forecasts: [[WeatherDetails]]?
    var dateHeaderText: [String] = []
    private var tempCities: [City]?
    var cities: [City] {
        return getCityList()
    }
    func getData( city: City, reloadAction: ((Bool) -> ())?,
     alertAction: ((String) -> ())?) {
        dateHeaderText = ["Today", "Tomorrow"]
        Constants.LocationURL.city = city.name ?? ""
        Constants.LocationURL.isoCountryCode = city.isoCountryCode ?? ""
        self.downloadData(withURLString: Constants.LocationURL.location) { result in
            
            switch result {
                
            case .error(message: let msg):
                print(msg)
                
            case .value(let val):
                
                self.parseJSONData(withForecastData: val) { parseResult in
                    
                    switch parseResult {
                    case .value(let forecastProvider):
                        
                        self.createForecasts(weatherPredictor: forecastProvider)
                        //self.forecastVCDelegate?.reloadData()
                        reloadAction!(true)
                    case .error(let err):
                        print(err)
                        
                    }
                }
            }
        }

        }
        
        //
        //  Creates multidimensional array, each element represents another day
        //  Requires refactoring to make it flexible for any amount of results
        //
        func createForecasts(weatherPredictor: WeatherPredictor) {
            
            var tempForecasts = [[WeatherDetails]](repeating: [WeatherDetails](), count: 5)
            
            weatherPredictor.forecasts.forEach({ item in
                
                let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
                
                let day2 = Calendar.current.date(byAdding: .day, value: 1, to: Date())!
                let day3 = Calendar.current.date(byAdding: .day, value: 2, to: Date())!
                let day4 = Calendar.current.date(byAdding: .day, value: 3, to: Date())!
                let day5 = Calendar.current.date(byAdding: .day, value: 4, to: Date())!
                
                if calendar.isDateInToday(item.date) {
                    tempForecasts[0].append(item)
                    return
                }
                if calendar.isDate(item.date, equalTo: day2, toGranularity: .day) {
                    tempForecasts[1].append(item)
                    return
                }
                if calendar.isDate(item.date, equalTo: day3, toGranularity: .day) {
                    tempForecasts[2].append(item)
                    populateDateHeaderText(withDate: item.date)
                    return
                }
                if calendar.isDate(item.date, equalTo: day4, toGranularity: .day) {
                    tempForecasts[3].append(item)
                    populateDateHeaderText(withDate: item.date)
                    return
                }
                if calendar.isDate(item.date, equalTo: day5, toGranularity: .day) {
                    tempForecasts[4].append(item)
                    populateDateHeaderText(withDate: item.date)
                }
                
            })
            self.forecasts = tempForecasts
        }
        
        func populateDateHeaderText(withDate date: Date) {
            
            let formattedDateString = stringFromDate(date: date)
            
            if !dateHeaderText.contains(formattedDateString) {
                dateHeaderText.append(formattedDateString)
            }
        }
    func getCityList() -> [City] {
        if tempCities != nil && tempCities!.count > 0{
            return tempCities! 
        }else{
            if let cityList = City.loadJson(filename: "city"){
                tempCities = cityList
                return cityList
        }
        return cities
        }
    }
    func getCityForName(name: String) -> City?{
        var selected :City?
        for  oneCity in cities{
            if oneCity.name == name {
                selected = oneCity
                break
            }
        }
        return selected
    }
    }


