//
//  trackingInformation.swift
//  Bitcamp
//
//  Created by Shruti Sharma on 4/7/18.
//  Copyright © 2018 Shruti Sharma. All rights reserved.
//

import Foundation
import CoreLocation
import Alamofire

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
            
            let user = "AC97d1eb0c84e630cfd2c550bf6b4797ae"
            let password = "800d5839001e6c5e68e8505a020ff9ce"
            let credentialData = "\(user):\(password)".data(using: String.Encoding.utf8)!
            let base64Credentials = credentialData.base64EncodedString(options: [])
            let headers = ["Authorization": "Basic \(base64Credentials)"]
            
            let parameters = ["From": "2028384157", "To": "3013773822", "Body": "Hello from Swift!"]
            
            
            Alamofire.request("https://api.twilio.com/2010-04-01/Accounts/AC97d1eb0c84e630cfd2c550bf6b4797ae/Messages",
                              method: .post,
                              parameters: parameters,
                              encoding: URLEncoding.default,
                              headers:headers)
                .validate()
                .responseJSON { response in
                    if response.result.value != nil{
                        print(response)
                    }else{
                        print ("error")
                    }
            }
        }
    }
}
