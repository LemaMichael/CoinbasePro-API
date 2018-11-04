import UIKit


typealias Candles = [[Double]]
let baseURL = "https://api.pro.coinbase.com/products/"
//let url = "https://api.gdax.com/products/BTC-USD/candles?start= 2017-01-01T00:00:00 .00000Z&end= 2017-01-01T05:00:00 .00000Z&granularity= 300"

func historicRate(_ request: URL) {
    URLSession.shared.dataTask(with: request) { data, _, error in
        guard let data = data, error == nil else { return }
        do {
            let decoder = JSONDecoder()
            let candles = try decoder.decode(Candles.self, from: data)
           // print(candles)
            print(candles.count)
            print(candles.last![0])
            print(candles[0][0])
            let firstDate = Date(timeIntervalSince1970: candles.last![0])
            let enddate = Date(timeIntervalSince1970: candles[0][0])
            print(firstDate, enddate)
            
        } catch let error as NSError {
            print("Failed to get candles:  \(error.localizedDescription)")
            print(request.absoluteString)
        }
        }.resume()
}

extension Formatter {
    static let iso8601: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        return formatter
    }()
}


// 2018-01-01T05:00:00
let productId = "BTC-USD"
//let granularity = "60"
let granularity = "300"
//let granularity = "900"
//let granularity = "3600"
//let granularity = "21600"
// let granularity = "86400"

let formatter = ISO8601DateFormatter()
let currentDate = Date()
let isoEnd = formatter.string(from: currentDate)

let endDate = Calendar.current.date(byAdding: .day, value: -1, to: currentDate)!
let isoStart = formatter.string(from: endDate)

let newOutput = baseURL + productId + "/candles?start=\(isoStart)&end=\(isoEnd)&granularity=\(granularity)"


let dataURL = URL(string: newOutput)!
historicRate(dataURL)

