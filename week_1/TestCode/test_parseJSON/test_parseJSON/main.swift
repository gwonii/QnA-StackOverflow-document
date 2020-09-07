//
//  main.swift
//  test_parseJSON
//
//  Created by gwonii on 2020/09/07.
//  Copyright © 2020 gwonii. All rights reserved.
//

import Foundation



let jsonString: String = """
{
    "blocked_list": {
        "total": 2,
        "users": [
            {
                "id": 49,
                "name": "fdewer12faasd",
                "profilePicture": "",
                "followStatus": 0
            }
        ]
    }
}
"""

//
let decoder = JSONDecoder()

let data: Data? = jsonString.data(using: .utf8)

func encode(block: CurrentUserBlockList) -> String {
    let encoder = JSONEncoder()
    
    let jsonData = try? encoder.encode(block)
    let jsonString = String(data: jsonData!, encoding: .utf8)
    
    return jsonString ?? "error"
}

// Method
func decode(_ blockdata: Data) -> JSONResponse? {
    let decoder = JSONDecoder()
    do {
        let decodedData = try decoder.decode(JSONResponse.self, from: blockdata)
//        let usersArray = decodedData.users
//        let count = decodedData.total
//        let blockModel = CurrentUserBlockListModel(users: usersArray,total:count)
        return decodedData
        
    } catch {
        print("error")
        return nil
    }
}

let testObject = decode(data!)

print("result: \(testObject)")

//let object: CurrentUserBlockList = .init(total: 2, users: [.init(followStatus: 0, id: 49, name: "fdewer12faasd", profilePicture: "")])
//
//let result: String = encode(block: object)
//print("result: \(result)")

