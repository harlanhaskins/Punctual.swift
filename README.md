# Punctual.swift
Swift dates, more fun. Heavily inspired by [ObjectiveSugar](https://github.com/supermarin/objectivesugar)

# Installation
Punctual is available through [CocoaPods](http://cocoapods.org)!

Just add this line
```ruby
pod 'Punctual'
```
to your `Podfile`

# Contents
`Punctual` extends `Int`, `NSDateComponents`, `NSDate`, and `NSCalendarUnit`, and adds features to make them work well together. It uses the robust `NSCalendar` APIs, so you can be sure it's accurate!

```swift
println(1.day.ago)
// Optional(2015-04-08 04:49:30 +0000)

println(10.days.until(NSDate()))
// Optional(2015-03-30 04:11:03 +0000)

println((1.day + 2.months - 9.years).ago)
// Optional(2024-02-08 18:28:26 +0000)

println(NSDate() - 1.day.ago!)
/* <NSDateComponents: 0x7fbbaad949d0>
    Era: 0
    Calendar Year: 0
    Month: 0
    Day: 0
    Hour: 23
    Minute: 59
    Second: 59
    Nanosecond: 999999023
    Quarter: 0
    Year for Week of Year: 0
    Week of Year: 0
    Week of Month: 0
    Weekday: 0
    Weekday Ordinal: 0 */

println(1.year.timeInterval)
// Optional(31622400.0)

println((NSDate() + 30.minutes)!.nearestHour)
// 1

println(4.years.fromNow?.longTimeString)
// Optional("12:11:44 AM EDT")

println(4.years.fromNow?.stringWithFormat("HH:mm"))
// Optional("00:11")

```
