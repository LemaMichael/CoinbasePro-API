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
            self.filterProductbyCurrency(.USD)
            self.filterProductbyCurrency(.BTC)
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
    
    func filterProductbyCurrency(_ currency: QuoteCurrency) {
        for product in products {
            if product.quoteCurrency == currency.rawValue {
                print(product.id)
            }
        }
        print("\n")
    }
}

