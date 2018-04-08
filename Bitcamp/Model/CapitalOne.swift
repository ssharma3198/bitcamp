//
//  CapitalOne.swift
//  Bitcamp
//
//  Created by Shruti Sharma on 4/7/18.
//  Copyright © 2018 Shruti Sharma. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import CoreLocation

class CO {
    private static let merchantLink: String = "http://api.reimaginebanking.com/merchants?key=6a3c792ae7f52418ee4c661f3b9d77d2"
    
    static func getMerchants() {
        Alamofire.request(merchantLink)
            .responseJSON { response in
                switch response.result{
                case .success:
                    let jsonArray = (response.result.value as! NSArray)
                    for merchant in jsonArray {
                        let json = JSON(merchant)
                        let longitude = json["geocode"]["lng"].double
                        let latitude = json["geocode"]["lat"].double
                        let coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(latitude!), longitude: CLLocationDegrees(longitude!))
                        let _ = Merchant(id: json["_id"].string!, name: json["name"].string!, category: json["category"].string!, street: json["address"]["street_name"].string ?? "", number: json["address"]["street_number"].string!, location: coordinate)
                    }
                    
                case .failure:
                    print (response.result)
                }
                
        }
        print (Merchant.allMerchants)
    }
}
