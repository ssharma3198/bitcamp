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
    var payerId: String
    let medium = "balance"
    var amount: Int
    var status = "pending"
    
    init(merchant_id i: String, payerId p: String, amount a: Int) {
        merchant_id = i
        amount = a
        payerId = p
    }
}
