//
//  Punctual.swift
//  Punctual
//
//  Created by Harlan Haskins on 4/7/15.
//  Copyright (c) 2015 harlanhaskins. All rights reserved.
//

import Foundation

extension Int {
    public var era: NSDateComponents {
        let components = NSDateComponents()
        components.era = self
        return components
    }
    public var eras: NSDateComponents {
        return self.era
    }
    public var year: NSDateComponents {
        let components = NSDateComponents()
        components.year = self
        return components
    }
    public var years: NSDateComponents {
        return self.year
    }
    public var month: NSDateComponents {
        let components = NSDateComponents()
        components.month = self
        return components
    }
    public var months: NSDateComponents {
        return self.month
    }
    public var day: NSDateComponents {
        let components = NSDateComponents()
        components.day = self
        return components
    }
    public var days: NSDateComponents {
        return self.day
    }
    public var hour: NSDateComponents {
        let components = NSDateComponents()
        components.hour = self
        return components
    }
    public var hours: NSDateComponents {
        return self.hour
    }
    public var minute: NSDateComponents {
        let components = NSDateComponents()
        components.minute = self
        return components
    }
    public var minutes: NSDateComponents {
        return self.minute
    }
    public var second: NSDateComponents {
        let components = NSDateComponents()
        components.second = self
        return components
    }
    public var seconds: NSDateComponents {
        return self.second
    }
    public var nanosecond: NSDateComponents {
        let components = NSDateComponents()
        components.nanosecond = self
        return components
    }
    public var nanoseconds: NSDateComponents {
        return self.nanosecond
    }
    public var weekday: NSDateComponents {
        let components = NSDateComponents()
        components.weekday = self
        return components
    }
    public var weekdays: NSDateComponents {
        return self.weekday
    }
    public var weekdayOrdinal: NSDateComponents {
        let components = NSDateComponents()
        components.weekdayOrdinal = self
        return components
    }
    public var weekdayOrdinals: NSDateComponents {
        return self.weekdayOrdinal
    }
    public var quarter: NSDateComponents {
        let components = NSDateComponents()
        components.quarter = self
        return components
    }
    public var quarters: NSDateComponents {
        return self.quarter
    }
    public var weekOfMonth: NSDateComponents {
        let components = NSDateComponents()
        components.weekOfMonth = self
        return components
    }
    public var weeksOfMonth: NSDateComponents {
        return self.weekOfMonth
    }
    public var weekOfYear: NSDateComponents {
        let components = NSDateComponents()
        components.weekOfYear = self
        return components
    }
    public var weeksOfYear: NSDateComponents {
        return self.weekOfYear
    }
    public var yearForWeekOfYear: NSDateComponents {
        let components = NSDateComponents()
        components.yearForWeekOfYear = self
        return components
    }
    public var yearsForWeekOfYear: NSDateComponents {
        return self.yearForWeekOfYear
    }
}

extension NSDateComponents {
    public var ago: NSDate? {
        return (-self).fromNow
    }
    
    public var fromNow: NSDate? {
        return self.fromDate(NSDate())
    }
    
    public func fromDate(date: NSDate) -> NSDate? {
        return NSCalendar.currentCalendar().dateByAddingComponents(self, toDate: date, options: NSCalendarOptions.allZeros)
    }
    
    public func untilDate(date: NSDate) -> NSDate? {
        return (-self).fromDate(date)
    }
}

private func applyIfDefined(int: Int, otherInt: Int,  transform: (Int, Int) -> Int) -> Int{
    switch (int, otherInt) {
    case (_, Int(NSDateComponentUndefined)): return int
    case (Int(NSDateComponentUndefined), _): return otherInt
    default: return transform(int, otherInt)
    }
}

private func applyIfDefined(int: Int, transform: Int -> Int) -> Int{
    return int == Int(NSDateComponentUndefined) ? int : transform(int)
}

public prefix func -(rhs: NSDateComponents) -> NSDateComponents {
    let components = NSDateComponents()
    components.era = applyIfDefined(rhs.era, -)
    components.year = applyIfDefined(rhs.year, -)
    components.month = applyIfDefined(rhs.month, -)
    components.day = applyIfDefined(rhs.day, -)
    components.hour = applyIfDefined(rhs.hour, -)
    components.minute = applyIfDefined(rhs.minute, -)
    components.second = applyIfDefined(rhs.second, -)
    components.nanosecond = applyIfDefined(rhs.nanosecond, -)
    components.weekday = applyIfDefined(rhs.weekday, -)
    components.weekdayOrdinal = applyIfDefined(rhs.weekdayOrdinal, -)
    components.quarter = applyIfDefined(rhs.quarter, -)
    components.weekOfMonth = applyIfDefined(rhs.weekOfMonth, -)
    components.weekOfYear = applyIfDefined(rhs.weekOfYear, -)
    components.yearForWeekOfYear = applyIfDefined(rhs.yearForWeekOfYear, -)
    return components
}

public func +(lhs: NSDateComponents, rhs: NSDateComponents) -> NSDateComponents {
    let components = NSDateComponents()
    components.era = applyIfDefined(lhs.era, rhs.era, +)
    components.year = applyIfDefined(lhs.year, rhs.year, +)
    components.month = applyIfDefined(lhs.month, rhs.month, +)
    components.day = applyIfDefined(lhs.day, rhs.day, +)
    components.hour = applyIfDefined(lhs.hour, rhs.hour, +)
    components.minute = applyIfDefined(lhs.minute, rhs.minute, +)
    components.second = applyIfDefined(lhs.second, rhs.second, +)
    components.nanosecond = applyIfDefined(lhs.nanosecond, rhs.nanosecond, +)
    components.weekday = applyIfDefined(lhs.weekday, rhs.weekday, +)
    components.weekdayOrdinal = applyIfDefined(lhs.weekdayOrdinal, rhs.weekdayOrdinal, +)
    components.quarter = applyIfDefined(lhs.quarter, rhs.quarter, +)
    components.weekOfMonth = applyIfDefined(lhs.weekOfMonth, rhs.weekOfMonth, +)
    components.weekOfYear = applyIfDefined(lhs.weekOfYear, rhs.weekOfYear, +)
    components.yearForWeekOfYear = applyIfDefined(lhs.yearForWeekOfYear, rhs.yearForWeekOfYear, +)
    return components
}