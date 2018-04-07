//
//  trackingInformation.swift
//  Bitcamp
//
//  Created by Shruti Sharma on 4/7/18.
//  Copyright © 2018 Shruti Sharma. All rights reserved.
//

import Foundation
import CoreLocation
// import SwiftKeychainWrapper


class Track {
    private static let manager = CLLocationManager()
    private var radius = CLCircularRegion()
    
   
    static func locationManager() {
        manager.requestAlwaysAuthorization()
        manager.requestWhenInUseAuthorization()
        
        
        if CLLocationManager.locationServicesEnabled() {
            manager.allowsBackgroundLocationUpdates = true
            manager.pausesLocationUpdatesAutomatically = false
            manager.startUpdatingLocation()
        }
    }
    
    static func notify(User u: User) {
        let loc = manager.location?.coordinate
        let area = u.area
        if area.contains(loc!) {
            // Send notification
        }
    }
}
