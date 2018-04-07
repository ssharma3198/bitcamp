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
    
    func initUser(u: User) {
        radius =  u.radius
    }
    
    static func locationManager() {
        manager.requestAlwaysAuthorization()
        manager.requestWhenInUseAuthorization()
        
        
        if CLLocationManager.locationServicesEnabled() {
            manager.allowsBackgroundLocationUpdates = true
            manager.pausesLocationUpdatesAutomatically = false
            manager.startUpdatingLocation()
        }
        
        
    }
    
    static func notify() {
        let loc = manager.location?.coordinate
        
    }
}
