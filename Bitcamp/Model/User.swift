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
    var locations: Dictionary<String, Int>! // id -> number of visits
    var mostFrequentMerchant: Merchant!
    var area: CLCircularRegion
    
    init(Name n: String!, locations loc: Dictionary<String, Int>!) {
        name = n
        locations = loc
        var maxVisits = 0
        var mostFrequentLoc = ""
        for (key, value) in locations {
            if value > maxVisits {
                mostFrequentLoc = key
                maxVisits = value
            }
        }
        mostFrequentMerchant = Merchant.allMerchants[mostFrequentLoc]
        area = CLCircularRegion.init(center: mostFrequentMerchant.geocode_coordinate, radius: 1.0, identifier: mostFrequentMerchant._id)
    }
    
    func frequentLocations() -> String {
        var maxVisits = 0
        var locationId = ""
        for (key, value) in locations {
            if value > maxVisits {
                locationId = key
                maxVisits = value
            }
        }
        return locationId
    }

}

