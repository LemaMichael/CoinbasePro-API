//
//  DateRange.swift
//  CoinbasePro
//
//  Created by Michael Lema on 11/3/18.
//  Copyright © 2018 Michael Lema. All rights reserved.
//

import UIKit

public enum DateRange {
    case oneHour
    case day
    case week
    case month // 21600
    case oneYear
    case all
    
    public func dates()->(start:Date,end:Date) {
        return (start(),Date())
    }
    
    public func start()->Date {
        switch self {
        case .oneHour:
            return dateBack(unit: .hour, amount: 1)
        case .day:
            return dateBack(unit: .day, amount: 1)
        case .week:
            return dateBack(unit: .day, amount: 7)
        case .month:
            return dateBack(unit: .month, amount: 1)
        case .oneYear:
            return dateBack(unit: .year, amount: 1)
        case .all:
            return dateBack(unit: .year, amount: 5)
        }
    }
    
    private func dateBack(unit:Calendar.Component,amount:Int)->Date {
        return Calendar.current.date(
            byAdding: unit,
            value: -amount,
            to: Date()
            )!
    }
    
}
