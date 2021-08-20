//
//  TutorialPageViewController.swift
//  FinalProject
//
//  Created by PRPL on 04.07.2020.
//  Copyright © 2020 kosheliev. All rights reserved.
//

import UIKit
import CoreData

final class TutorialPageViewController: UIPageViewController {
    
    // MARK: - Variables
    
    weak var tutorialDelegate: TutorialPageViewControllerDelegate?
    
    private (set) lazy var viewControllersList: [UIViewController] = {
        return [self.newTutorialViewController("VC1"),
                self.newTutorialViewController("VC2"),
                self.newTutorialViewController("VC3")]
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        delegate = self
                
        if let initialViewController = viewControllersList.first {
            scrollToViewController(viewController: initialViewController)
        }
        
        tutorialDelegate?.tutorialPageViewController(tutorialPageViewController: self, didUpdatePageCount: viewControllersList.count)
    }
    
    // MARK: - Scroll on PageVC
    
    func scrollToNextViewController() {
        if let visibleViewController = viewControllers?.first,
           let nextViewController = pageViewController(self, viewControllerAfter: visibleViewController) {
            scrollToViewController(viewController: nextViewController)
        }
    }
    
    func scrollToViewController(index newIndex: Int) {
        if let firstViewController = viewControllers?.first,
           let currentIndex = viewControllersList.firstIndex(of: firstViewController) {
            let direction: UIPageViewController.NavigationDirection = newIndex >= currentIndex ? .forward : .reverse
            let nextViewController = viewControllersList[newIndex]
            scrollToViewController(viewController: nextViewController, direction: direction)
        }
    }
    
    func newTutorialViewController(_ name: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil) .
            instantiateViewController(withIdentifier: "\(name)ViewController")
    }
    
    private func scrollToViewController(viewController: UIViewController,
                                        direction: UIPageViewController.NavigationDirection = .forward) {
        setViewControllers([viewController],
                           direction: direction,
                           animated: true,
                           completion: { (finished) -> Void in
                            self.notifyTutorialDelegateOfNewIndex()
                           })
    }
    
    private func notifyTutorialDelegateOfNewIndex() {
        if let firstViewController = viewControllers?.first,
           let index = viewControllersList.firstIndex(of: firstViewController) {
            tutorialDelegate?.tutorialPageViewController(tutorialPageViewController: self, didUpdatePageIndex: index)
        }
    }
    
}

// MARK: UIPageViewControllerDataSource

extension TutorialPageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = viewControllersList.firstIndex(of: viewController) else {return nil}
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {return nil}
        
        guard viewControllersList.count > previousIndex else {return nil}
        
        return viewControllersList[previousIndex]
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = viewControllersList.firstIndex(of: viewController) else {return nil}
        
        let nextIndex = viewControllerIndex + 1
        
        let viewControllersListCount = viewControllersList.count
        
        guard viewControllersListCount != nextIndex else {return nil}
        
        guard viewControllersListCount > nextIndex else {return nil}
        
        return viewControllersList[nextIndex]
    }
    
}

extension TutorialPageViewController: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            didFinishAnimating finished: Bool,
                            previousViewControllers: [UIViewController],
                            transitionCompleted completed: Bool) {
        notifyTutorialDelegateOfNewIndex()
    }
    
}

protocol TutorialPageViewControllerDelegate: AnyObject {
    
    func tutorialPageViewController(tutorialPageViewController: TutorialPageViewController,
                                    didUpdatePageCount count: Int)
    
    func tutorialPageViewController(tutorialPageViewController: TutorialPageViewController,
                                    didUpdatePageIndex index: Int)
    
}
