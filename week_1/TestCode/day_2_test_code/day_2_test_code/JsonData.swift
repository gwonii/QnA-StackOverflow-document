//
//  JsonData.swift
//  day_2_test_code
//
//  Created by gwonii on 2020/09/08.
//  Copyright © 2020 gwonii. All rights reserved.
//

import Foundation

//let jsonString = """
//"status": {
//    "timestamp": "2020-09-03T11:33:00.616Z",
//    "error_code": 0,
//    "error_message": null,
//    "elapsed": 101,
//    "credit_count": 1,
//    "notice": null
//},
//"data": [
//    {
//        "id": 1,
//        "name": "Bitcoin",
//        "symbol": "BTC",
//        "slug": "bitcoin",
//        "num_market_pairs": 8938,
//        "date_added": "2013-04-28T00:00:00.000Z",
//        "tags": [
//            "mineable",
//            "pow",
//            "sha-256",
//            "store-of-value",
//            "state-channels"
//        ],
//        "max_supply": 21000000,
//        "circulating_supply": 18478475,
//        "total_supply": 18478475,
//        "platform": null,
//        "cmc_rank": 1,
//        "last_updated": "2020-09-03T11:31:33.000Z",
//        "quote": {
//            "USD": {
//                "price": 11273.4407683,
//                "volume_24h": 25364037841.8901,
//                "percent_change_1h": -0.600125,
//                "percent_change_24h": -2.18778,
//                "percent_change_7d": -0.96201,
//                "market_cap": 208315993401.01236,
//                "last_updated": "2020-09-03T11:31:33.000Z"
//            }
//        }
//    }
//]
//
//"""

let jsonString = """
{
"data": [
    {
        "id": 1,
        "name": "Bitcoin",
        "symbol": "BTC",
        "slug": "bitcoin",
        "num_market_pairs": 8938,
        "date_added": "2013-04-28T00:00:00.000Z",
        "tags": [
            "mineable",
            "pow",
            "sha-256",
            "store-of-value",
            "state-channels"
        ],
        "max_supply": 21000000,
        "circulating_supply": 18478475,
        "total_supply": 18478475,
        "platform": null,
        "cmc_rank": 1,
        "last_updated": "2020-09-03T11:31:33.000Z",
        "quote": {
            "USD": {
                "price": 11273.4407683,
                "volume_24h": 25364037841.8901,
                "percent_change_1h": -0.600125,
                "percent_change_24h": -2.18778,
                "percent_change_7d": -0.96201,
                "market_cap": 208315993401.01236,
                "last_updated": "2020-09-03T11:31:33.000Z"
            }
        }
    }
]
}
"""



