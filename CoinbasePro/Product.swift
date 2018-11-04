//
//  Products.swift
//  CoinbasePro
//
//  Created by Michael Lema on 11/3/18.
//  Copyright © 2018 Michael Lema. All rights reserved.
//

import Foundation

typealias Products = [Product]

struct Product: Codable {
    let id: String
    let baseCurrency: String
    let quoteCurrency: String
    let baseMinSize: String
    let baseMaxSize: String
    let quoteIncrement: String
    let displayName: String
    let status: String
    let marginEnabled: Bool
    let statusMessage: String?
    let minMarketFunds: String
    let maxMarketFunds: String
    let postOnly: Bool
    let limitOnly: Bool
    let cancelOnly: Bool
    
    // Added Info
    var open: String?
    var high: String?
    var low: String?
    var volume: String?
    
    var currentPrice: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case baseCurrency = "base_currency"
        case quoteCurrency = "quote_currency"
        case baseMinSize = "base_min_size"
        case baseMaxSize = "base_max_size"
        case quoteIncrement = "quote_increment"
        case displayName = "display_name"
        case status = "status"
        case marginEnabled = "margin_enabled"
        case statusMessage = "status_message"
        case minMarketFunds = "min_market_funds"
        case maxMarketFunds = "max_market_funds"
        case postOnly = "post_only"
        case limitOnly = "limit_only"
        case cancelOnly = "cancel_only"
        
        case open = "open"
        case high = "high"
        case low = "low"
        case volume = "volume"
        case currentPrice = "currentPrice"
    }
}
