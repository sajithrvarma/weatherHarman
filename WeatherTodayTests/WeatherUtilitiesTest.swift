//
//  WeatherUtilitiesTest.swift
//  WeatherTodayTests
//
//  Created by Sajith Ramavarma on 28/09/18.
//  Copyright © 2018 Applied Materials. All rights reserved.
//

import XCTest
@testable import WeatherToday
class WeatherUtilitiesTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAsDate() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let testDate = "2018-09-28 18:00:00"
        let tempDate = testDate.asDate()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let dateString = dateFormatter.string(from: tempDate)
        XCTAssertTrue(dateString == "18:00", "dateString is different")
    }
    func testTimeStringFromDate(){
        let testDate = "2018-09-28 18:00:00"
        let tempDate = testDate.asDate()
        let time = timeStringFromDate(date: tempDate)
        XCTAssertTrue(time == "18:00", "dateString is different")
    }
    func testStringFromDate(){
        let testDate = "2018-09-28 18:00:00"
        let tempDate = testDate.asDate()
        let dateString = stringFromDate(date: tempDate)
        XCTAssertTrue(dateString == "28th Sep", "dateString is different")
    }
    func testSuffix(){
        let testDate = "2018-09-02 18:00:00"
        let tempDate = testDate.asDate()
        let suffix = daySuffix(date: tempDate)
         XCTAssertTrue(suffix == "nd", "suffix is different")
    }


}
