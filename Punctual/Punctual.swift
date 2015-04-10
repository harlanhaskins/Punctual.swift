//
//  Punctual.swift
//  Punctual
//
//  Created by Harlan Haskins on 4/7/15.
//  Copyright (c) 2015 harlanhaskins. All rights reserved.
//

import Foundation

/// MARK: Int extensions

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

/// MARK: NSDateComponents extensions

extension NSDateComponents {
    /// Returns a date that occured "the receiver's components" before now.
    public var ago: NSDate? {
        return self.until(NSDate())
    }
    
    /// Returns the date that will occur once the receiver's components pass after now.
    public var fromNow: NSDate? {
        return self.from(NSDate())
    }
    
    /// Returns the date that will occur once the receiver's components pass after the provide date.
    public func from(date: NSDate) -> NSDate? {
        return NSCalendar.currentCalendar().dateByAddingComponents(self, toDate: date, options: NSCalendarOptions.allZeros)
    }
    
    /// Returns a date that occured "the receiver's components" before the provided date.
    public func until(date: NSDate) -> NSDate? {
        return (-self).from(date)
    }
    
    /// An NSTimeInterval representing the delta, in seconds, of an NSDateComponents instance.
    public var timeInterval: NSTimeInterval? {
        let templateDate = NSDate()
        let finalDate = templateDate + self
        return finalDate?.timeIntervalSinceDate(templateDate)
    }
}

/// Applies the `transform` to the two `Ints` provided, unless either of them is
/// `NSDateComponentUndefined`
private func applyIfDefined(int: Int, otherInt: Int,  transform: (Int, Int) -> Int) -> Int{
    switch (int, otherInt) {
    case (_, Int(NSDateComponentUndefined)): return transform(0, int)
    case (Int(NSDateComponentUndefined), _): return transform(0, otherInt)
    default: return transform(int, otherInt)
    }
}

/// Applies the `transform` to the `int`
/// iff `int != NSDateComponentUndefined`
private func applyIfDefined(int: Int, transform: Int -> Int) -> Int{
    return int == Int(NSDateComponentUndefined) ? int : transform(int)
}

/// Returns a new `NSDateComponents` that represents the negative of all values within the
/// components that are not `NSDateComponentUndefined`.
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

/// Combines two date components using the provided `transform` on all 
/// values within the components that are not `NSDateComponentUndefined`.
private func combine(lhs: NSDateComponents, rhs: NSDateComponents, transform: (Int, Int) -> Int) -> NSDateComponents {
    let components = NSDateComponents()
    components.era = applyIfDefined(lhs.era, rhs.era, transform)
    components.year = applyIfDefined(lhs.year, rhs.year, transform)
    components.month = applyIfDefined(lhs.month, rhs.month, transform)
    components.day = applyIfDefined(lhs.day, rhs.day, transform)
    components.hour = applyIfDefined(lhs.hour, rhs.hour, transform)
    components.minute = applyIfDefined(lhs.minute, rhs.minute, transform)
    components.second = applyIfDefined(lhs.second, rhs.second, transform)
    components.nanosecond = applyIfDefined(lhs.nanosecond, rhs.nanosecond, transform)
    components.weekday = applyIfDefined(lhs.weekday, rhs.weekday, transform)
    components.weekdayOrdinal = applyIfDefined(lhs.weekdayOrdinal, rhs.weekdayOrdinal, transform)
    components.quarter = applyIfDefined(lhs.quarter, rhs.quarter, transform)
    components.weekOfMonth = applyIfDefined(lhs.weekOfMonth, rhs.weekOfMonth, transform)
    components.weekOfYear = applyIfDefined(lhs.weekOfYear, rhs.weekOfYear, transform)
    components.yearForWeekOfYear = applyIfDefined(lhs.yearForWeekOfYear, rhs.yearForWeekOfYear, transform)
    return components
}

/// Adds two NSDateComponents and returns their combined individual components.
public func +(lhs: NSDateComponents, rhs: NSDateComponents) -> NSDateComponents {
    return combine(lhs, rhs, +)
}

/// Subtracts two NSDateComponents and returns the relative difference between them.
public func -(lhs: NSDateComponents, rhs: NSDateComponents) -> NSDateComponents {
    return lhs + (-rhs)
}

/// MARK: NSDate extensions

extension NSDate: Comparable {
    private struct Constants {
        // Create one instance of NSDateFormatter because
        // NSFormatters are expensive to allocate.
        static let formatter = NSDateFormatter()
    }
    public var isToday: Bool {
        return NSCalendar.currentCalendar().isDateInToday(self)
    }
    public var isYesterday: Bool {
        return NSCalendar.currentCalendar().isDateInYesterday(self)
    }
    public var isTomorrow: Bool {
        return NSCalendar.currentCalendar().isDateInTomorrow(self)
    }
    public var isWeekend: Bool {
        return NSCalendar.currentCalendar().isDateInWeekend(self)
    }
    
    public func stringWithFormat(format: String) -> String {
        Constants.formatter.dateFormat = format
        let date = Constants.formatter.stringFromDate(self)
        Constants.formatter.dateFormat = nil
        return date
    }
    
    public func stringWithDateStyle(dateStyle: NSDateFormatterStyle, timeStyle: NSDateFormatterStyle) -> String {
        Constants.formatter.dateStyle = dateStyle
        Constants.formatter.timeStyle = timeStyle
        let date = Constants.formatter.stringFromDate(self)
        Constants.formatter.dateStyle = .NoStyle
        Constants.formatter.timeStyle = .NoStyle
        return date
    }
    
    public var shortString: String {
        return self.stringWithDateStyle(.ShortStyle, timeStyle: .ShortStyle)
    }
    
    public var shortTimeString: String {
        return self.stringWithDateStyle(.NoStyle, timeStyle: .ShortStyle)
    }
    
    public var shortDateString: String {
        return self.stringWithDateStyle(.ShortStyle, timeStyle: .NoStyle)
    }
    
    public var mediumString: String {
        return self.stringWithDateStyle(.MediumStyle, timeStyle: .MediumStyle)
    }
    
    public var mediumTimeString: String {
        return self.stringWithDateStyle(.NoStyle, timeStyle: .MediumStyle)
    }
    
    public var mediumDateString: String {
        return self.stringWithDateStyle(.MediumStyle, timeStyle: .NoStyle)
    }
    
    public var longString: String {
        return self.stringWithDateStyle(.LongStyle, timeStyle: .LongStyle)
    }
    
    public var longTimeString: String {
        return self.stringWithDateStyle(.NoStyle, timeStyle: .LongStyle)
    }
    
    public var longDateString: String {
        return self.stringWithDateStyle(.LongStyle, timeStyle: .NoStyle)
    }
    
    public var era: Int {
        return self.components.era
    }
    public var eras: Int {
        return self.era
    }
    public var year: Int {
        return self.components.year
    }
    public var years: Int {
        return self.year
    }
    public var month: Int {
        return self.components.month
    }
    public var months: Int {
        return self.month
    }
    public var day: Int {
        return self.components.day
    }
    public var days: Int {
        return self.day
    }
    public var hour: Int {
        return self.components.hour
    }
    public var hours: Int {
        return self.hour
    }
    public var minute: Int {
        return self.components.minute
    }
    public var minutes: Int {
        return self.minute
    }
    public var second: Int {
        return self.components.second
    }
    public var seconds: Int {
        return self.second
    }
    public var nanosecond: Int {
        return self.components.nanosecond
    }
    public var nanoseconds: Int {
        return self.nanosecond
    }
    public var weekday: Int {
        return self.components.weekday
    }
    public var weekdays: Int {
        return self.weekday
    }
    public var weekdayOrdinal: Int {
        return self.components.weekdayOrdinal
    }
    public var weekdayOrdinals: Int {
        return self.weekdayOrdinal
    }
    public var quarter: Int {
        return self.components.quarter
    }
    public var quarters: Int {
        return self.quarter
    }
    public var weekOfMonth: Int {
        return self.components.weekOfMonth
    }
    public var weekOfMonths: Int {
        return self.weekOfMonth
    }
    public var weekOfYear: Int {
        return self.components.weekOfYear
    }
    public var weekOfYears: Int {
        return self.weekOfYear
    }
    public var yearForWeekOfYear: Int {
        return self.components.yearForWeekOfYear
    }
    public var yearForWeekOfYears: Int {
        return self.yearForWeekOfYear
    }
    public var components: NSDateComponents {
        return NSCalendar.currentCalendar().components(NSCalendarUnit.allValues, fromDate: self)
    }
}

extension NSCalendarUnit {
    /// Shortcut for 'all calendar units'.
    static var allValues: NSCalendarUnit {
        return  NSCalendarUnit.CalendarUnitEra
              | NSCalendarUnit.CalendarUnitYear
              | NSCalendarUnit.CalendarUnitMonth
              | NSCalendarUnit.CalendarUnitDay
              | NSCalendarUnit.CalendarUnitHour
              | NSCalendarUnit.CalendarUnitMinute
              | NSCalendarUnit.CalendarUnitSecond
              | NSCalendarUnit.CalendarUnitWeekday
              | NSCalendarUnit.CalendarUnitWeekdayOrdinal
              | NSCalendarUnit.CalendarUnitQuarter
              | NSCalendarUnit.CalendarUnitWeekOfMonth
              | NSCalendarUnit.CalendarUnitWeekOfYear
              | NSCalendarUnit.CalendarUnitYearForWeekOfYear
              | NSCalendarUnit.CalendarUnitNanosecond
              | NSCalendarUnit.CalendarUnitCalendar
              | NSCalendarUnit.CalendarUnitTimeZone
    }
}

public func <(lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.compare(rhs) == .OrderedAscending
}

public func ==(lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.isEqualToDate(rhs)
}

/// Subtracts two dates and returns the relative components from `lhs` to `rhs`.
/// Follows this mathematical pattern:
///     let difference = lhs - rhs
///     rhs + difference = lhs
public func -(lhs: NSDate, rhs: NSDate) -> NSDateComponents {
    return NSCalendar.currentCalendar().components(NSCalendarUnit.allValues, fromDate: rhs, toDate: lhs, options: .MatchStrictly)
}

/// Adds date components to a date and returns a new date.
public func +(lhs: NSDate, rhs: NSDateComponents) -> NSDate? {
    return rhs.from(lhs)
}

/// Adds date components to a date and returns a new date.
public func +(lhs: NSDateComponents, rhs: NSDate) -> NSDate? {
    return rhs + lhs
}

/// Subtracts date components from a date and returns a new date.
public func -(lhs: NSDate, rhs: NSDateComponents) -> NSDate? {
    return lhs + (-rhs)
}