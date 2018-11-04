//
//  ViewController.swift
//  CoinbasePro
//
//  Created by Michael Lema on 11/3/18.
//  Copyright © 2018 Michael Lema. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var products = Products()
    let baseAPI = "https://api.pro.coinbase.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        requestProducts {
            print("Finished parsing data!")
            //self.filterProductbyCurrency(.USD)
            //self.filterProductbyCurrency(.BTC)
           self.getProductPrice()
        }
    }
    
    func requestProducts(finished: @escaping () -> Void) {
        guard let url = URL(string: baseAPI + "/products") else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else { return }
            do {
                let decoder = JSONDecoder()
                self.products = try decoder.decode(Products.self, from: data)
                
                finished()
            } catch let error as NSError {
                print("error:  \(error.localizedDescription)")
            }
            }.resume()
    }
    
    func filterProductbyCurrency(_ currency: QuoteCurrency) ->  [Product] {
        return self.products.filter { ($0.quoteCurrency == currency.rawValue) }
    }
    
    func getProductPrice() {
        for product in 0..<products.count {
            fetchPrice(products[product].id) { (price) in
                print(self.products[product].id)
                self.products[product].currentPrice = price
                print(self.products[product].currentPrice ?? "")
            }
            
            fetch24HourStats(products[product].id) { (open, volume) in
                self.products[product].open = open
                self.products[product].volume = volume
                print(self.products[product].open ?? "", self.products[product].volume ?? "")
            }
        }
     
    }
    
    func fetchPrice(_ productId: String, callback: @escaping (String) -> Void) {
        guard let url = URL(string: baseAPI + "/products/\(productId)/ticker") else { return }
        Client.shared.getPrice(url) { (price) in
            callback(price)
        }
        
        
    }
    
    func fetch24HourStats(_ productId: String, callback: @escaping (String, String) -> Void) {
        guard let url = URL(string: baseAPI + "/products/\(productId)/stats") else { return }
        Client.shared.get24HourStats(url) { (open, volume) in
            callback(open, volume)
        }
    }
    
    
}

