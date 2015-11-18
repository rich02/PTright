//
//  AppDelegate.swift
//  PTRight
//
//  Created by MU IT Program on 11/12/15.
//  Copyright © 2015 James Tapia. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    lazy var coreDataStack = CoreDataStack()

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
      //  let navigationController = window!.rootViewController as! UINavigationController
        
      //  let tableViewController = navigationController.topViewController as! MyInjuriesTableViewController
        
     //   tableViewController.managedContext = coreDataStack.context
        
        return true
    }

    func applicationDidEnterBackground(application: UIApplication) {
        
        coreDataStack.saveContext()
    }

    func applicationWillTerminate(application: UIApplication) {
    
        coreDataStack.saveContext()
    }


}

