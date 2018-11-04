//
//  Stats.swift
//  CoinbasePro
//
//  Created by Michael Lema on 11/3/18.
//  Copyright © 2018 Michael Lema. All rights reserved.
//

import Foundation

struct Stats: Codable {
    let statsOpen: String
    let high: String
    let low: String
    let volume: String
    let last: String
    let volume30Day: String
    
    enum CodingKeys: String, CodingKey {
        case statsOpen = "open"
        case high = "high"
        case low = "low"
        case volume = "volume"
        case last = "last"
        case volume30Day = "volume_30day"
    }
}
