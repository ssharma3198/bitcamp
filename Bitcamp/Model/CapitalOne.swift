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
    private static let purchasesLink: String = ""
    private static let accounts = ["5ac829bf322fa06b67793844", "5ac829bf322fa06b67793845", "5ac829bf322fa06b67793846"]
    private static let users = ["5ac829bd322fa06b67793841", "5ac829be322fa06b67793842", "5ac829bf322fa06b67793843"]
    
    static func getMerchants() {
        Alamofire.request(merchantLink)
            .responseJSON { response in
                switch response.result{
                case .success:
                    let jsonArray = (response.result.value as! NSArray)
                    for merchant in jsonArray {
                        if ((merchant as! NSDictionary).count == 6) {
                         
                            let json = JSON(merchant)
                            let longitude = json["geocode"]["lng"].double ??  0
                            let latitude = json["geocode"]["lat"].double ?? 0
                            let coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(latitude), longitude: CLLocationDegrees(longitude))
                            let _id = json["_id"].string!
                            let _name = json["name"].string!
                            let _category = json["category"].string ?? "food"
                            let _street = json["address"]["street_name"].string ?? ""
                            let _number = json["address"]["street_number"].string ?? "00000"
                            let _ = Merchant(id: _id, name: _name, category: _category, street: _street, number: _number, location: coordinate)
                        }
                        
                    }
                    
                case .failure:
                    print (response.result)
                }
                
        }
        print (Merchant.allMerchants)
    }
    
    static func getPurchases() {
        for account in accounts {
            let url = "http://api.reimaginebanking.com/accounts/\(account)/purchases?key=6a3c792ae7f52418ee4c661f3b9d77d2"
            var userPurchases = Dictionary<String, [Int]>()
            Alamofire.request(url)
                .responseJSON { response in
                    switch response.result{
                    case .success:
                        let jsonArray = response.result.value as! NSArray
                        for purchase in jsonArray {
                            let json = JSON(purchase)
                            let _merchant_id = json["merchant_id"].string
                            
                            var numVisits = 0
                            var cost = 0
                            if userPurchases[_merchant_id!] != nil {
                                let values = userPurchases[_merchant_id!]
                                numVisits = values![0]
                                cost = values![1]
                            }
                            
                            let _amount = json["amount"].int
                            let _payer_id = json["payer_id"].string
                            let _ = Purchase(merchant_id: _merchant_id!, payerId: _payer_id!, amount: _amount!)
                            
                            userPurchases[_merchant_id!] = [numVisits+1, (cost+_amount!)]
                        }
                        
                    case .failure:
                        print (response.result)
                    }
            }
        }
    }
}
