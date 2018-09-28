//
//  weatherMiscellaneous.swift
//  WeatherTodayTests
//
//  Created by Sajith Ramavarma on 28/09/18.
//  Copyright © 2018 Applied Materials. All rights reserved.
//

import XCTest
@testable import WeatherToday
class weatherMiscellaneousTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDownloadImage() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let weathermodel = WeatherViewModel()
        weathermodel.downloadImageData(withURLString: "http://openweathermap.org/img/w/02d.png") { (results) in
            
            switch results {
                
            case .error(message: let msg):
                XCTAssertNil(msg, "received error as nil")
            case .value(let val):
                XCTAssertNil(val, "received image  data as nil")
            }
        }
        
    }
    func testDownloadData() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let weathermodel = WeatherViewModel()
        weathermodel.downloadData(withURLString: Constants.LocationURL.location) { (results) in
            switch results {
            case .error(message: let msg):
                XCTAssertNil(msg, "received error as nil")
            case .value(let val):
                XCTAssertNil(val, "received   data as nil")
            }
        }
        
    }
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
