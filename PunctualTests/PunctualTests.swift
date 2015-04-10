//
//  PunctualTests.swift
//  PunctualTests
//
//  Created by Harlan Haskins on 4/7/15.
//  Copyright (c) 2015 harlanhaskins. All rights reserved.
//

import UIKit
import XCTest
import Punctual

class PunctualTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testYesterday() {
        println(1.nanosecond.ago)
        println(10.days.until(NSDate()))
        println((1.day + 2.months - 9.years).ago)
        println(NSDate() - 1.day.ago!)
        println((4.days + 9.hours + 32.minutes).timeInterval)
        println(1.year.timeInterval)
        println((NSDate() + 30.minutes)!.nearestHour)
        println(4.years.fromNow?.longTimeString)
        println(4.years.fromNow?.stringWithFormat("HH:mm"))
        println(4.years.fromNow?.shortString)
        println(4.years.fromNow?.shortString)
        println(4.years.fromNow?.longTimeString)
    }
    
    func testDateSubtraction() {
        let first = NSDate()
        XCTAssertEqual(1, (first - 1.day.until(first)!).day, "Subtraction should return appropriate date.")
    }
    
}
