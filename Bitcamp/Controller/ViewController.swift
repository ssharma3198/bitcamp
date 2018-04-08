//
//  ViewController.swift
//  Bitcamp
//
//  Created by Shruti Sharma on 4/7/18.
//  Copyright © 2018 Shruti Sharma. All rights reserved.
//

import UIKit
import Foundation

var name = ""

class ViewController: UIViewController {

    @IBOutlet weak var name_outlet: UITextField!
    
    @IBAction func submit_action(_ sender: AnyObject)
    {
        if (name_outlet.text != "")
        {
            name = name_outlet.text!
            performSegue(withIdentifier: "config_to_stat", sender: self)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

