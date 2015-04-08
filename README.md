# Punctual.swift
Swift dates, more fun. Heavily inspired by [ObjectiveSugar](https://github.com/supermarin/objectivesugar)

# Installation
This project is very, very early, and is subject to change at a moment's notice. I'll put it on `CocoaPods` when it's closer to release.

# Contents
`Punctual` extends `Int` and `NSDateComponents` and adds features to make them work well together.

```swift
println(1.day.ago)
println(10.days.untilDate(NSDate()))
println((1.day + 2.months + 6.years).fromNow)
```
