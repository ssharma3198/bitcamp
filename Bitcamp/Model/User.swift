//
//  User.swift
//  Bitcamp
//
//  Created by Shruti Sharma on 4/7/18.
//  Copyright © 2018 Shruti Sharma. All rights reserved.
//

import Foundation
import CoreLocation

class User {
    var name: String!
    var locations: Dictionary<String, [Int]>! // id -> number of visits
    var mostFrequentMerchant: Merchant!
    var area: CLCircularRegion
    
    init(Name n: String!, locations loc: Dictionary<String, [Int]>!) {
        name = n
        locations = loc
        var maxSpent = 0
        var mostFrequentLoc = ""
        for (key, values) in locations {
            let amountSpent = values[1]
            if amountSpent > maxSpent {
                mostFrequentLoc = key
                maxSpent = amountSpent
            }
        }
        mostFrequentMerchant = Merchant.allMerchants[mostFrequentLoc]
        area = CLCircularRegion.init(center: mostFrequentMerchant.geocode_coordinate, radius: 1.0, identifier: mostFrequentMerchant._id)
    }
    
    func frequentLocations() -> String {
        var maxSpent = 0
        var locationId = ""
        for (key, values) in locations {
            let amountSpent = values[1]
            if amountSpent > maxSpent {
                locationId = key
                maxSpent = amountSpent
            }
        }
        return locationId
    }
    
}
