//
//  Purchase.swift
//  Bitcamp
//
//  Created by Lucia Kim on 4/7/18.
//  Copyright © 2018 Shruti Sharma. All rights reserved.
//

import Foundation

struct Purchase {
    var merchant_id: String
    let medium = "balance"
    var purchase_date: String
    var amount: Int
    var status = "pending"
    var description: String
    
    init(merchant_id i: String, purchase_date date: String, amount a: Int, description desc: String) {
        merchant_id = i
        purchase_date = date
        amount = a
        description = desc
    }
}
