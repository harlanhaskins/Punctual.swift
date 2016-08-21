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
    public var era: DateComponents {
        var components = DateComponents()
        components.era = self
        return components
    }
    public var eras: DateComponents {
        return self.era
    }
    public var year: DateComponents {
        var components = DateComponents()
        components.year = self
        return components
    }
    public var years: DateComponents {
        return self.year
    }
    public var month: DateComponents {
        var components = DateComponents()
        components.month = self
        return components
    }
    public var months: DateComponents {
        return self.month
    }
    public var day: DateComponents {
        var components = DateComponents()
        components.day = self
        return components
    }
    public var days: DateComponents {
        return self.day
    }
    public var hour: DateComponents {
        var components = DateComponents()
        components.hour = self
        return components
    }
    public var hours: DateComponents {
        return self.hour
    }
    public var minute: DateComponents {
        var components = DateComponents()
        components.minute = self
        return components
    }
    public var minutes: DateComponents {
        return self.minute
    }
    public var second: DateComponents {
        var components = DateComponents()
        components.second = self
        return components
    }
    public var seconds: DateComponents {
        return self.second
    }
    public var nanosecond: DateComponents {
        var components = DateComponents()
        components.nanosecond = self
        return components
    }
    public var nanoseconds: DateComponents {
        return self.nanosecond
    }
    public var millisecond: DateComponents {
        return (1000000 * self).nanoseconds
    }
    public var milliseconds: DateComponents {
        return self.millisecond
    }
    public var weekday: DateComponents {
        var components = DateComponents()
        components.weekday = self
        return components
    }
    public var weekdays: DateComponents {
        return self.weekday
    }
    public var weekdayOrdinal: DateComponents {
        var components = DateComponents()
        components.weekdayOrdinal = self
        return components
    }
    public var weekdayOrdinals: DateComponents {
        return self.weekdayOrdinal
    }
    public var quarter: DateComponents {
        var components = DateComponents()
        components.quarter = self
        return components
    }
    public var quarters: DateComponents {
        return self.quarter
    }
    public var weekOfMonth: DateComponents {
        var components = DateComponents()
        components.weekOfMonth = self
        return components
    }
    public var weeksOfMonth: DateComponents {
        return self.weekOfMonth
    }
    public var weekOfYear: DateComponents {
        var components = DateComponents()
        components.weekOfYear = self
        return components
    }
    public var weeksOfYear: DateComponents {
        return self.weekOfYear
    }
    public var yearForWeekOfYear: DateComponents {
        var components = DateComponents()
        components.yearForWeekOfYear = self
        return components
    }
    public var yearsForWeekOfYear: DateComponents {
        return self.yearForWeekOfYear
    }
}

/// MARK: NSDateComponents extensions

extension DateComponents {
    /// - returns: a date that occured "the receiver's components" before now.
    public var ago: Date? {
        return self.until(Date())
    }

    /// - returns: the date that will occur once the receiver's components pass after now.
    public var fromNow: Date? {
        return self.from(Date())
    }

    /// - returns: the date that will occur once the receiver's components pass after the provide date.
    public func from(_ date: Date) -> Date? {
        return Calendar.autoupdatingCurrent.date(byAdding: self, to: date)
    }

    /// - returns: a date that occured "the receiver's components" before the provided date.
    public func until(_ date: Date) -> Date? {
        return (-self).from(date)
    }

    /// An NSTimeInterval representing the delta, in seconds, of an NSDateComponents instance.
    public var timeInterval: TimeInterval? {
        let templateDate = Date()
        let finalDate = templateDate + self
        return finalDate?.timeIntervalSince(templateDate)
    }
}

/// Applies the `transform` to the two `T` provided, defaulting either of them if it's
/// `nil`
internal func bimap<T>(_ a: T?, _ b: T?, default: T, _ transform: (T, T) -> T) -> T? {
    if a == nil && b == nil { return nil }
    return transform(a ?? `default`, b ?? `default`)
}

/// - returns: a new `NSDateComponents` that represents the negative of all values within the
/// components that are not `NSDateComponentUndefined`.
public prefix func -(rhs: DateComponents) -> DateComponents {
    var components = DateComponents()
    components.era = rhs.era.map(-)
    components.year = rhs.year.map(-)
    components.month = rhs.month.map(-)
    components.day = rhs.day.map(-)
    components.hour = rhs.hour.map(-)
    components.minute = rhs.minute.map(-)
    components.second = rhs.second.map(-)
    components.nanosecond = rhs.nanosecond.map(-)
    components.weekday = rhs.weekday.map(-)
    components.weekdayOrdinal = rhs.weekdayOrdinal.map(-)
    components.quarter = rhs.quarter.map(-)
    components.weekOfMonth = rhs.weekOfMonth.map(-)
    components.weekOfYear = rhs.weekOfYear.map(-)
    components.yearForWeekOfYear = rhs.yearForWeekOfYear.map(-)
    return components
}

/// Combines two date components using the provided `transform` on all
/// values within the components that are not `NSDateComponentUndefined`.
private func combine(_ lhs: DateComponents, rhs: DateComponents, transform: (Int, Int) -> Int) -> DateComponents {
    var components = DateComponents()
    components.era = bimap(lhs.era, rhs.era, default: 0, transform)
    components.year = bimap(lhs.year, rhs.year, default: 0, transform)
    components.month = bimap(lhs.month, rhs.month, default: 0, transform)
    components.day = bimap(lhs.day, rhs.day, default: 0, transform)
    components.hour = bimap(lhs.hour, rhs.hour, default: 0, transform)
    components.minute = bimap(lhs.minute, rhs.minute, default: 0, transform)
    components.second = bimap(lhs.second, rhs.second, default: 0, transform)
    components.nanosecond = bimap(lhs.nanosecond, rhs.nanosecond, default: 0, transform)
    components.weekday = bimap(lhs.weekday, rhs.weekday, default: 0, transform)
    components.weekdayOrdinal = bimap(lhs.weekdayOrdinal, rhs.weekdayOrdinal, default: 0, transform)
    components.quarter = bimap(lhs.quarter, rhs.quarter, default: 0, transform)
    components.weekOfMonth = bimap(lhs.weekOfMonth, rhs.weekOfMonth, default: 0, transform)
    components.weekOfYear = bimap(lhs.weekOfYear, rhs.weekOfYear, default: 0, transform)
    components.yearForWeekOfYear = bimap(lhs.yearForWeekOfYear, rhs.yearForWeekOfYear, default: 0, transform)
    return components
}

/// Adds two NSDateComponents and returns their combined individual components.
public func +(lhs: DateComponents, rhs: DateComponents) -> DateComponents {
    return combine(lhs, rhs: rhs, transform: +)
}

/// Subtracts two NSDateComponents and returns the relative difference between them.
public func -(lhs: DateComponents, rhs: DateComponents) -> DateComponents {
    return lhs + (-rhs)
}

/// MARK: NSDate extensions

extension Date {
    fileprivate struct Constants {
        // Create one instance of DateFormatter because
        // Formatters are expensive to allocate.
        static let formatter = DateFormatter()
        static let minutesPerHour = 60
    }
    @available(iOS, introduced: 8.0)
    public var isToday: Bool {
        return Calendar.autoupdatingCurrent.isDateInToday(self)
    }
    @available(iOS, introduced: 8.0)
    public var isYesterday: Bool {
        return Calendar.autoupdatingCurrent.isDateInYesterday(self)
    }
    @available(iOS, introduced: 8.0)
    public var isTomorrow: Bool {
        return Calendar.autoupdatingCurrent.isDateInTomorrow(self)
    }
    @available(iOS, introduced: 8.0)
    public var isWeekend: Bool {
        return Calendar.autoupdatingCurrent.isDateInWeekend(self)
    }
    public var isInPast: Bool {
        return self < Date()
    }
    public var isInFuture: Bool {
        return self > Date()
    }
    public var nearestHour: Int {
        return self.minutes > (Constants.minutesPerHour / 2) ? self.hour + 1 : self.hour
    }
    
    @available(*, unavailable, renamed: "string(format:)")
    public func stringWithFormat(_ format: String) -> String {
        return string(format: format)
    }
    public func string(format: String) -> String {
        Constants.formatter.dateFormat = format
        let date = Constants.formatter.string(from: self)
        Constants.formatter.dateFormat = nil
        return date
    }
  
    @available(*, unavailable, renamed: "string(dateStyle:timeStyle:)")
    public func stringWithDateStyle(_ dateStyle: DateFormatter.Style, timeStyle: DateFormatter.Style) -> String {
      return string(dateStyle: dateStyle, timeStyle: timeStyle)
    }

    public func string(dateStyle: DateFormatter.Style, timeStyle: DateFormatter.Style) -> String {
        Constants.formatter.dateStyle = dateStyle
        Constants.formatter.timeStyle = timeStyle
        let date = Constants.formatter.string(from: self)
        Constants.formatter.dateStyle = .none
        Constants.formatter.timeStyle = .none
        return date
    }

    public var shortString: String {
        return self.string(dateStyle: .short, timeStyle: .short)
    }

    public var shortTimeString: String {
        return self.string(dateStyle: .none, timeStyle: .short)
    }

    public var shortDateString: String {
        return self.string(dateStyle: .short, timeStyle: .none)
    }

    public var mediumString: String {
        return self.string(dateStyle: .medium, timeStyle: .medium)
    }

    public var mediumTimeString: String {
        return self.string(dateStyle: .none, timeStyle: .medium)
    }

    public var mediumDateString: String {
        return self.string(dateStyle: .medium, timeStyle: .none)
    }

    public var longString: String {
        return self.string(dateStyle: .long, timeStyle: .long)
    }

    public var longTimeString: String {
        return self.string(dateStyle: .none, timeStyle: .long)
    }

    public var longDateString: String {
        return self.string(dateStyle: .long, timeStyle: .none)
    }

    public var era: Int {
        return self.components.era!
    }
    public var eras: Int {
        return self.era
    }
    public var year: Int {
        return self.components.year!
    }
    public var years: Int {
        return self.year
    }
    public var month: Int {
        return self.components.month!
    }
    public var months: Int {
        return self.month
    }
    public var day: Int {
        return self.components.day!
    }
    public var days: Int {
        return self.day
    }
    public var hour: Int {
        return self.components.hour!
    }
    public var hours: Int {
        return self.hour
    }
    public var minute: Int {
        return self.components.minute!
    }
    public var minutes: Int {
        return self.minute
    }
    public var second: Int {
        return self.components.second!
    }
    public var seconds: Int {
        return self.second
    }
    public var nanosecond: Int {
        return self.components.nanosecond!
    }
    public var nanoseconds: Int {
        return self.nanosecond
    }
    public var weekday: Int {
        return self.components.weekday!
    }
    public var weekdays: Int {
        return self.weekday
    }
    public var weekdayOrdinal: Int {
        return self.components.weekdayOrdinal!
    }
    public var weekdayOrdinals: Int {
        return self.weekdayOrdinal
    }
    public var quarter: Int {
        return self.components.quarter!
    }
    public var quarters: Int {
        return self.quarter
    }
    public var weekOfMonth: Int {
        return self.components.weekOfMonth!
    }
    public var weekOfMonths: Int {
        return self.weekOfMonth
    }
    public var weekOfYear: Int {
        return self.components.weekOfYear!
    }
    public var weekOfYears: Int {
        return self.weekOfYear
    }
    public var yearForWeekOfYear: Int {
        return self.components.yearForWeekOfYear!
    }
    public var yearForWeekOfYears: Int {
        return self.yearForWeekOfYear
    }
    public var components: DateComponents {
        return Calendar.autoupdatingCurrent.dateComponents(Calendar.Component.allValues, from: self)
    }
    public static func fromComponents(_ components: DateComponents) -> Date? {
        return Calendar.autoupdatingCurrent.date(from: components)
    }
}

extension Calendar.Component {
    /// Shortcut for 'all calendar components'.
    static var allValues: Set<Calendar.Component> {
        return [.era, .year, .month, .day, .hour, .minute,
                .second, .weekday, .weekdayOrdinal, .quarter,
                .weekOfMonth, .weekOfYear, .yearForWeekOfYear,
                .nanosecond, .calendar, .timeZone]
    }
}

/// Subtracts two dates and returns the relative components from `lhs` to `rhs`.
/// Follows this mathematical pattern:
///     let difference = lhs - rhs
///     rhs + difference = lhs
public func -(lhs: Date, rhs: Date) -> DateComponents {
    return Calendar.autoupdatingCurrent.dateComponents(Calendar.Component.allValues, from: rhs, to: lhs)
}

/// Adds date components to a date and returns a new date.
public func +(lhs: Date, rhs: DateComponents) -> Date? {
    return rhs.from(lhs)
}

/// Adds date components to a date and returns a new date.
public func +(lhs: DateComponents, rhs: Date) -> Date? {
    return rhs + lhs
}

/// Subtracts date components from a date and returns a new date.
public func -(lhs: Date, rhs: DateComponents) -> Date? {
    return lhs + (-rhs)
}
