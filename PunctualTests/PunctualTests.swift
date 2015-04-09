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
        println(10.days.untilDate(NSDate()))
        println((10000000000.days + 2.months + (-9999999999999999).years).fromNow)
        println((4.days + 9.hours + 32.minutes).fromNow?.timeIntervalSinceNow)
        
    }
    
    func testDateSubtraction() {
        let first = NSDate()
        XCTAssertEqual(1, (first - 1.day.untilDate(first)!).day, "Subtraction should return appropriate date.")
    }
    
}
