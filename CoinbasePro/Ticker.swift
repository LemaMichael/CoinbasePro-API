//
//  Ticker.swift
//  CoinbasePro
//
//  Created by Michael Lema on 11/3/18.
//  Copyright © 2018 Michael Lema. All rights reserved.
//

import Foundation

struct Ticker: Codable {
    let tradeID: Int
    let price: String
    let size: String
    let bid: String?
    let ask: String?
    let volume: TickerVolume // For Unlisted Coins with no volume
    let time: String
    
    private enum CodingKeys: String, CodingKey {
        case tradeID = "trade_id"
        case price = "price"
        case size = "size"
        case bid = "bid"
        case ask = "ask"
        case volume = "volume"
        case time = "time"
    }
}

enum TickerVolume: Codable {
    case integer(Int)
    case string(String)
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Int.self) {
            self = .integer(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(TickerVolume.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Volume"))
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .integer(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}



