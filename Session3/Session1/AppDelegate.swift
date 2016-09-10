//
//  AppDelegate.swift
//  Session1
//
//  Created by Apple on 8/28/16.
//  Copyright © 2016 TechKids. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        testCGPointExtesion()
        return true
    }
    
    func testCGPointExtesion() {
        let p1 = CGPoint(x: 3, y: 4)
        let p2 = p1.multiply(2.0)
        
        assert(p2.x == 6.0 && p2.y == 8)
        
        let d = p1.distance(p2)
        
        assert(d == 5)
        
        let p3 = p1.normalize()
        
        assert(abs(p3.x - 0.6) < 0.0001)
        assert(abs(p3.y - 0.8) < 0.0001)
        
        print("testCGPointExtesion OK")
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

