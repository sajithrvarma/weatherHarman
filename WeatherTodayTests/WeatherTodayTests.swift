//
//  WeatherTodayTests.swift
//  WeatherTodayTests
//
//  Created by Sajith Ramavarma on 24/09/18.
//  Copyright © 2018 Applied Materials. All rights reserved.
//

import XCTest
@testable import WeatherToday

class WeatherTodayTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    func testDownload()
    {
        let viewModel = WeatherViewModel()
        viewModel.downloadData(withURLString: Constants.LocationURL.location) { (results) in
        XCTAssertNil(results, "weather data is nil")//test commit
        }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
