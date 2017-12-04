//
//  AppDelegate.swift
//  DualSlideMenu
//
//  Created by Vincent Le on 03/23/2016.
//  Copyright (c) 2016 Vincent Le. All rights reserved.
//

import UIKit
import DualSlideMenu

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var storyboard: UIStoryboard?
    var controller: DualSlideMenuViewController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        storyboard = UIStoryboard(name: "Main", bundle: nil)

        
        let leftView = storyboard?.instantiateViewController(withIdentifier: "LeftMenuController") as! LeftViewController
        let rightView = storyboard?.instantiateViewController(withIdentifier: "RightMenuController")
        let mainView = storyboard?.instantiateViewController(withIdentifier: "MainController") as! ExampleViewController
        
        let navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 20, width: mainView.view.frame.size.width, height: 44))
        let navigationItem = UINavigationItem()
        let menuButton = UIBarButtonItem(image: UIImage(named: "hamburger"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(AppDelegate.menuButtonTapped(_:)))
        let composeButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.add, target: self, action: #selector(AppDelegate.composeButtonTapped(_:)))
        let searchBar = UISearchBar()
        composeButton.accessibilityIdentifier = "compose"
        searchBar.sizeToFit()
        navigationItem.titleView = searchBar
        navigationItem.leftBarButtonItem = menuButton
        navigationItem.rightBarButtonItem = composeButton
        navigationBar.items = [navigationItem]
        mainView.view.addSubview(navigationBar)
        
        controller = DualSlideMenuViewController(mainViewController: mainView, leftMenuViewController: leftView, rightMenuViewController: rightView!)
        controller?.delegate = mainView
        controller!.leftSideOffset = 100
        controller!.rightSideOffset = 20
        controller!.addSwipeGestureInSide(rightView!, direction: .right)
        controller!.addSwipeGestureInSide(leftView, direction: .left)
        leftView.controller = controller
        window!.rootViewController = controller
        window!.makeKeyAndVisible()
        return true
    }
    
    @objc func menuButtonTapped(_ sender: UIBarButtonItem){
        controller?.toggle("right")
    }
    @objc func composeButtonTapped(_ sender: UIBarButtonItem){
        controller?.toggle("left")
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

