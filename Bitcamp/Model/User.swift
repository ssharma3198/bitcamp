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
    static var name: String!
    static var locations: Dictionary<String, [Int]>! // id -> number of visits
    static var mostFrequentMerchant: Merchant!
    static var area: CLCircularRegion!
    static var purchases = [Purchase]()
    
    init(Name n: String!, locations loc: Dictionary<String, [Int]>!, Purchases p: [Purchase]) {
        User.name = n
        User.locations = loc
        var maxSpent = 0
        var mostFrequentLoc = ""
        for (key, values) in User.locations {
            let amountSpent = values[1]
            if amountSpent > maxSpent {
                mostFrequentLoc = key
                maxSpent = amountSpent
            }
        }
        User.mostFrequentMerchant = Merchant.allMerchants[mostFrequentLoc]
        User.area = CLCircularRegion.init(center: User.mostFrequentMerchant.geocode_coordinate, radius: 1.0, identifier: User.mostFrequentMerchant._id)
        User.purchases = p
    }
    
    static func frequentLocations() -> String {
        var maxSpent = 0
        var locationId = ""
        for (key, values) in User.locations {
            let amountSpent = values[1]
            if amountSpent > maxSpent {
                locationId = key
                maxSpent = amountSpent
            }
        }
        return locationId
    }
    
}
