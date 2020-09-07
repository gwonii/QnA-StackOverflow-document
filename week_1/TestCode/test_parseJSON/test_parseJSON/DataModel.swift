//
//  DataModel.swift
//  test_parseJSON
//
//  Created by gwonii on 2020/09/07.
//  Copyright © 2020 gwonii. All rights reserved.
//

import Foundation

struct JSONResponse: Codable {
    let blocked_list: CurrentUserBlockList
}

struct CurrentUserBlockList : Codable  {
    let total : Int?
    let users : [users]
}

struct users : Codable {
    let followStatus : Int?
    let id : Int?
    let name : String?
    let profilePicture : String?
}
