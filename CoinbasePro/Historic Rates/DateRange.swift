//
//  DateRange.swift
//  CoinbasePro
//
//  Created by Michael Lema on 11/3/18.
//  Copyright © 2018 Michael Lema. All rights reserved.
//

import UIKit

public enum DateRange {

    case hour
    case day
    case week
    case month
    case year
    case all
    
    public func rangeAPI() -> String {
        let formatter = ISO8601DateFormatter()
        let end = formatter.string(from: Date())
        let start = formatter.string(from: self.start().0)
        let granularity = self.start().1.rawValue
        let newOutput = "candles?start=\(start)&end=\(end)&granularity=\(granularity)"
        return newOutput
    }
    
    public func start()-> (Date, Granularity) {
        switch self {
        case .hour:
            return (startDate(unit: .hour, amount: 1), .minute)
        case .day:
            return (startDate(unit: .day, amount: 1), .hour)
        case .week:
            return (startDate(unit: .day, amount: 7), .hour)
        case .month:
            return (startDate(unit: .month, amount: 1), .sixHours)
        case .year:
            return (startDate(unit: .month, amount: 9), .day) // Not complete
        case .all:
            return (startDate(unit: .year, amount: 5), .hour) //?
        }
    }
    
    private func startDate(unit: Calendar.Component, amount:Int) -> Date {
        return Calendar.current.date(
            byAdding: unit,
            value: -amount,
            to: Date()
            )!
    }
    
}
