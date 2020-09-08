//
//  ParseMethods.swift
//  day_2_test_code
//
//  Created by gwonii on 2020/09/08.
//  Copyright © 2020 gwonii. All rights reserved.
//

import Foundation

func loadData() {
    //
    //    guard let url = URL(string: "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest") else {
    //        print("Wrong URL.")
    //        return
    //    }
    //
    //    let finalURL = url
    //    var request = URLRequest(url: finalURL)
    //    request.addValue("c972ac08-519e-47e5-8cd8-23e6230289f3", forHTTPHeaderField: "X-CMC_PRO_API_KEY")
    //
    
    //    let dataTask = URLSession.shared.dataTask(with: request) { (data, responce, error) in
    
    let jsonData = jsonString.data(using: .utf8)
    
    if let jsonData = jsonData {
        do {
            let cryptoData = try JSONDecoder().decode(Response.self, from: jsonData)
            print(cryptoData)
        }
            
        catch {
            print(error)
        }
    }
}

