//
//  AppDelegate.swift
//  FinalProject
//
//  Created by PRPL on 04.07.2020.
//  Copyright © 2020 kosheliev. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

   var window: UIWindow?

   func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      
      window = UIWindow(frame: UIScreen.main.bounds)
      
      let storyBoard = UIStoryboard(name: "Main", bundle: nil)
      
      var initialViewController = storyBoard.instantiateViewController(withIdentifier: "TutorialViewController")
      let userDefaults = UserDefaults.standard
      
      if userDefaults.bool(forKey: "hasViewedTutorial") {
         initialViewController = storyBoard.instantiateViewController(withIdentifier: "StartViewController")
      }
      
      window?.rootViewController = initialViewController
      window?.makeKeyAndVisible()

      return true
   }

  
}
