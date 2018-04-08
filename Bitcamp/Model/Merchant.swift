
//
//  Merchant.swift
//  Bitcamp
//
//  Created by Shruti Sharma on 4/7/18.
//  Copyright © 2018 Shruti Sharma. All rights reserved.
//

import Foundation
import CoreLocation

struct Merchant {
    var name: String
    var _id: String
    var category: String
    var address_streetName: String
    var address_streetNumber: String
    var geocode_coordinate: CLLocationCoordinate2D
    static var allMerchants = Dictionary<String, Merchant>()
    
    init(id i: String, name n: String, category c: String, street s: String, number num: String, location  loc: CLLocationCoordinate2D) {
        name = n
        _id = i
        category = c
        address_streetName = s
        address_streetNumber = num
        geocode_coordinate = loc
        Merchant.allMerchants[i] = self
    }
}


