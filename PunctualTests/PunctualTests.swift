//
//  PunctualTests.swift
//  PunctualTests
//
//  Created by Harlan Haskins on 4/7/15.
//  Copyright (c) 2015 harlanhaskins. All rights reserved.
//

import UIKit
import XCTest
@testable import Punctual

class PunctualTests: XCTestCase {
    
    let referenceDate = NSDate(timeIntervalSince1970: 0)
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testApplyIfDefined() {
        XCTAssertEqual(Punctual.applyIfDefined(1, 2, +), 3, "Numbers should be added")
        XCTAssertEqual(Punctual.applyIfDefined(NSDateComponentUndefined, 2, +), 2, "NSDateComponentUndefined should be ignored")
        XCTAssertEqual(Punctual.applyIfDefined(2, NSDateComponentUndefined, +), 2, "NSDateComponentUndefined should be ignored")
        XCTAssertEqual(Punctual.applyIfDefined(NSDateComponentUndefined, NSDateComponentUndefined, +), NSDateComponentUndefined, "NSDateComponentUndefined should be ignored")
        
        XCTAssertEqual(Punctual.applyIfDefined(1, -), -1, "Numbers should be negated")
        XCTAssertEqual(Punctual.applyIfDefined(NSDateComponentUndefined, -), NSDateComponentUndefined, "NSDateComponentUndefined should be ignored")
    }
    
    func testWeekend() {
        XCTAssert(!referenceDate.isWeekend, "Unix time began on a weekday.")
    }
    
    func testYesterday() {
        print(1.nanosecond.ago)
        print(10.days.until(NSDate()))
        print((1.day + 2.months - 9.years).ago)
        print(NSDate() - 1.day.ago!)
        print((4.days + 9.hours + 32.minutes).timeInterval)
        print(1.year.timeInterval)
        print((NSDate() + 30.minutes)!.nearestHour)
        print(4.years.fromNow?.longTimeString)
        print(4.years.fromNow?.stringWithFormat("HH:mm"))
        print(4.years.fromNow?.shortString)
    }
    
    func testDateSubtraction() {
        XCTAssertEqual(1, (referenceDate - 1.day.until(referenceDate)!).day, "Subtraction should return appropriate date.")
    }
    
}
