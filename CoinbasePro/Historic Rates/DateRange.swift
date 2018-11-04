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
            return (dateBack(unit: .hour, amount: 1), .minute)
        case .day:
            return (dateBack(unit: .day, amount: 1), .hour)
        case .week:
            return (dateBack(unit: .day, amount: 7), .hour)
        case .month:
            return (dateBack(unit: .month, amount: 1), .sixHours)
        case .year:
            return (dateBack(unit: .month, amount: 9), .day) // Not complete
        case .all:
            return (dateBack(unit: .year, amount: 5), .hour) //?
        }
    }
    
    private func dateBack(unit: Calendar.Component, amount:Int) -> Date {
        return Calendar.current.date(
            byAdding: unit,
            value: -amount,
            to: Date()
            )!
    }
    
}
