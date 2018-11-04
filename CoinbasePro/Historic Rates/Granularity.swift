//
//  Granularity.swift
//  CoinbasePro
//
//  Created by Michael Lema on 11/3/18.
//  Copyright © 2018 Michael Lema. All rights reserved.
//

import Foundation

public enum Granularity: String {
    case minute = "60"
    case fiveMinutes = "300"
    case fifteenMinutes = "900"
    case hour = "3600"
    case sixHours = "21600"
    case day = "86400"
}
