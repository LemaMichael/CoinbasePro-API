//
//  Client.swift
//  CoinbasePro
//
//  Created by Michael Lema on 11/3/18.
//  Copyright © 2018 Michael Lema. All rights reserved.
//

import Foundation

class Client: NSObject {
    
    static let shared = Client()
    
    func getPrice(_ request: URL, callback: @escaping (String) -> Void) {
        URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else { return }
            do {
                let decoder = JSONDecoder()
                let ticker = try decoder.decode(Ticker.self, from: data)
                callback(ticker.price)
            } catch let error as NSError {
                print("Failed to get price:  \(error.localizedDescription)")
                print(request.absoluteString)
            }
            }.resume()
    }
    
    func get24HourStats(_ request: URL, callback: @escaping (_ open: String, _ volume: String) -> Void) {
        URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else { return }
            do {
                let decoder = JSONDecoder()
                let stats = try decoder.decode(Stats.self, from: data)
                callback(stats.statsOpen, stats.volume)
            } catch let error as NSError {
                print("Failed to get stats:  \(error.localizedDescription)")
                print(request.absoluteString)
            }
            }.resume()
    }
    
    func gethistoricRate(_ request: URL, range: DateRange, callback: @escaping(_ candles: Candles) -> Void) {
        URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else { return }
            do {
                let decoder = JSONDecoder()
                let candles = try decoder.decode(Candles.self, from: data)
//                for item in candles {
//                    print("Close Price: \(item.close)")
//                }
                
                print(candles[0].time)
                print(Date(timeIntervalSince1970: candles[0].time))
                print(candles.last!.time)
                print(Date(timeIntervalSince1970: candles.last!.time))
                
                
            } catch let error as NSError {
                print("Failed to get stats:  \(error.localizedDescription)")
                print(request.absoluteString)
            }
            }.resume()
    }
    
}
