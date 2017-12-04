//
//  ExampleViewController.swift
//  DualSlideMenu
//
//  Created by Vincent Le on 3/25/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
import DualSlideMenu

class ExampleViewController: UIViewController, DualSlideMenuViewControllerDelegate {
    func onSwipe() {
        print("did swipe")
    }
    func didChangeView() {
        print("view did change")
    }
}
