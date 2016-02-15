//
//  ViewController.swift
//  PageViewController
//
//  Created by Mirko Saiu on 26/12/15.
//  Copyright © 2015 Mirko Saiu. All rights reserved.
//

import UIKit

class PageViewController: UIViewController,UIPageViewControllerDataSource {
    
    var pageViewController: UIPageViewController!
    var pageTitles: NSArray!
    var pageImages: NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.pageTitles = NSArray(objects: "Koala", "Bradypus", "Toucan")
        self.pageImages = NSArray(objects: "koala", "bradypus", "toucan")
        
        
        self.pageViewController = self.storyboard?.instantiateViewControllerWithIdentifier("Page") as! UIPageViewController
        
        self.pageViewController.dataSource = self
        
        
        let startVC = self.viewControllerAtIndex(0) as ContentViewController
        
        let viewControllers = NSArray(object: startVC)
        
        
        
        self.pageViewController.setViewControllers(viewControllers as? [UIViewController], direction: .Forward, animated: true, completion: nil)
        
        
        self.pageViewController.view.frame = CGRectMake(0, 30, self.view.frame.width, self.view.frame.size.height - 60)
        
        
        self.addChildViewController(self.pageViewController)
        
        self.view.addSubview(self.pageViewController.view)
        
        self.pageViewController.didMoveToParentViewController(self)
        
    }
    
    
    func viewControllerAtIndex(index: Int) -> ContentViewController
        
    {
        
        if ((self.pageTitles.count == 0) || (index >= self.pageTitles.count)) {
            
            return ContentViewController()
            
        }
        
        
        
        let vc: ContentViewController = self.storyboard?.instantiateViewControllerWithIdentifier("Content") as! ContentViewController
        
        
        
        vc.titleText = self.pageTitles[index] as! String
        vc.imageFileName = pageImages[index] as! String
        
        vc.pageIndex = index
        
        
        
        return vc
        
        
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController?
        
    {
        
        
        
        let vc = viewController as! ContentViewController
        
        var index = vc.pageIndex as Int
        
        
        if (index == 0 || index == NSNotFound)
            
        {
            
            return nil
            
            
            
        }
        
        
        
        index--
        
        return self.viewControllerAtIndex(index)
        
        
        
    }
    
    
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        
        
        let vc = viewController as! ContentViewController
        
        var index = vc.pageIndex as Int
        
        
        
        if (index == NSNotFound)
            
        {
            
            return nil
            
        }
        
        
        
        index++
        
        
        
        if (index == self.pageTitles.count)
        {
            return nil
        }
        
        
        
        return self.viewControllerAtIndex(index)
        
        
        
    }
    
    
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int
        
    {
        
        return self.pageTitles.count
        
    }
    
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int
        
    {
        
        return 0
        
    }
    
    
}

