//
//  ViewController.swift
//  Bitcamp
//
//  Created by Shruti Sharma on 4/7/18.
//  Copyright © 2018 Shruti Sharma. All rights reserved.
//

import UIKit
import Foundation
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let todoEndpoint: String = "http://api.reimaginebanking.com/customers/5ac829bd322fa06b67793841?key=6a3c792ae7f52418ee4c661f3b9d77d2"
        // Do any additional setup after loading the view, typically from a nib.
        
        Alamofire.request(todoEndpoint)
            .responseJSON { response in
                // check for errors
                guard response.result.error == nil else {
                    // got an error in getting the data, need to handle it
                    print("error")
                    print(response.result.error!)
                    return
                }
                
                // make sure we got some JSON since that's what we expect
                guard let json = response.result.value as? [String: Any] else {
                    print("didn't get todo object as JSON from API")
                    if let error = response.result.error {
                        print("Error: \(error)")
                    }
                    return
                }
                
                // get and print the title
                guard let first_name = json["first_name"] as? String else {
                    print("Could not get todo title from JSON")
                    return
                }
                print("The first name is: " + first_name)
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

