//
//  Response.swift
//  day_2_test_code
//
//  Created by gwonii on 2020/09/08.
//  Copyright © 2020 gwonii. All rights reserved.
//

import Foundation

struct Response: Decodable {
    var data: [CryptoData]
}

struct CryptoData: Decodable {

var id: Int
var name: String
var symbol: String
var slug: String
var maxSupply: Int?
var totalSupply: Int
var rank: Int
var lastUpdated: String

var quote: QuoteDetails

    enum CodingKeys: String, CodingKey {
        
        case id
        case name
        case symbol
        case slug
        case maxSupply = "max_supply"
        case totalSupply = "total_supply"
        case rank = "cmc_rank"
        case lastUpdated = "last_updated"
        case quote
    }
}

struct QuoteDetails: Decodable {
    var USD: QuoteUSD
}

struct QuoteUSD: Decodable {
    
    var price: Double
    var dailyVolume: Double
    var percentChangeIn1h: Double
    var percentChangeIn24h: Double
    var percentChangeIn7d: Double
    var marketCap: Double
    var lastUpdated: String
    
    enum CodingKeys: String, CodingKey {
        case price
        case dailyVolume = "volume_24h"
        case percentChangeIn1h = "percent_change_1h"
        case percentChangeIn24h = "percent_change_24h"
        case percentChangeIn7d = "percent_change_7d"
        case marketCap = "market_cap"
        case lastUpdated = "last_updated"
    }
}
