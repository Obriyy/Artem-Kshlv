//
//  ViewController.swift
//  FinalProject
//
//  Created by PRPL on 04.07.2020.
//  Copyright © 2020 kosheliev. All rights reserved.
//

import UIKit
import CoreData

final class TutorialViewController: UIViewController {
   
   @IBOutlet weak var containerView: UIView!
   @IBOutlet weak var pageControl: UIPageControl!
   @IBOutlet weak var startButton: UIButton!
   
   
   var tutorialPageViewController: TutorialPageViewController? {
      didSet {
         tutorialPageViewController?.tutorialDelegate = self
      }
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      pageControl.addTarget(self, action: Selector(("didChangePageControlValue")), for: .valueChanged)
   }

   
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if let tutorialPageViewController = segue.destination as? TutorialPageViewController {
         self.tutorialPageViewController = tutorialPageViewController
      }
   }
   
   
   func didChangePageControlValue() {
      tutorialPageViewController?.scrollToViewController(index: pageControl.currentPage)
   }
   
   @IBAction func getStarted(_ sender: UIButton) {
      
      let userDefaults = UserDefaults.standard
      userDefaults.set(true, forKey: "hasViewedTutorial")
      userDefaults.synchronize()
   }
}



extension TutorialViewController: TutorialPageViewControllerDelegate {
   
   func tutorialPageViewController(tutorialPageViewController: TutorialPageViewController,
                                   didUpdatePageCount count: Int) {
      pageControl.numberOfPages = count
   }
   
   func tutorialPageViewController(tutorialPageViewController: TutorialPageViewController,
                                   didUpdatePageIndex index: Int) {
      pageControl.currentPage = index
   }
   
}

