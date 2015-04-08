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
        println(1.day.ago)
        println(10.days.untilDate(NSDate()))
        println((1.day + 2.months + 6.years).fromNow)
        println((4.days + 9.hours + 32.minutes).fromNow?.timeIntervalSinceNow)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
