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
    var categor: String
    var address_streetName: String
    var address_streetNumber: String
    var geocode_coordinate: CLLocationCoordinate2D
}
