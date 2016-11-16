//
//  LeftViewController.swift
//  DualSlideMenu
//
//  Created by Vincent Le on 4/7/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
import DualSlideMenu

class LeftViewController: UIViewController {

    var controller: DualSlideMenuViewController!
    
    @IBOutlet weak var button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        button.layer.cornerRadius = 6
        button.backgroundColor = UIColor.red.withAlphaComponent(0.6)
        button.tintColor =  UIColor.brown
    }
    
    @IBAction func buttonClicked(_ sender: AnyObject) {
        controller.toMain()
    }

}
