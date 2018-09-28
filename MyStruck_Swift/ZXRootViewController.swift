//
//  ZXRootViewController.swift
//  Test
//
//  Created by 120v on 2018/9/28.
//  Copyright © 2018 MQ. All rights reserved.
//

import UIKit

class ZXRootViewController: NSObject {
    
    class ZXUITabbarController: UITabBarController {
        override func viewWillLayoutSubviews() {
            super.viewWillLayoutSubviews()
            if let items = self.tabBar.items {
                for i in 0..<items.count {
                    let item = items[i]
                    item.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
                }
            }
        }
    }
    
    private static var xxxTabbarVC:UITabBarController?
    class func zx_tabbarVC() -> UITabBarController! {
        guard let tabbarvc = xxxTabbarVC else {
            xxxTabbarVC = UITabBarController()
            xxxTabbarVC?.tabBar.layer.shadowColor = UIColor.red.cgColor
            xxxTabbarVC?.tabBar.layer.shadowRadius = 5
            xxxTabbarVC?.tabBar.layer.shadowOffset = CGSize(width: 0, height: -2)
            xxxTabbarVC?.tabBar.layer.shadowOpacity = 0.25
            
            return xxxTabbarVC!
            
        }
        return tabbarvc
    }
    
    class func reload() {
        xxxTabbarVC = nil
        let tabbarvc = self.zx_tabbarVC()
        tabbarvc?.zx_addChildViewController(TestVC1(), fromPlistItemIndex: 0)
        tabbarvc?.zx_addChildViewController(TestVC2(), fromPlistItemIndex: 1)
        tabbarvc?.zx_addChildViewController(TestVC3(), fromPlistItemIndex: 2)
        tabbarvc?.zx_addChildViewController(TestVC4(), fromPlistItemIndex: 3)
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            tabbarvc?.delegate = appDelegate as? UITabBarControllerDelegate
        }
    }
    
    class func appWindow() -> UIWindow? {
        if let delegate = UIApplication.shared.delegate as? AppDelegate {
            return delegate.window
        }
        return nil
    }
}


extension UINavigationController {
    
    override open var prefersStatusBarHidden: Bool {
        return false
    }
    
    override open var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    override open var childForStatusBarStyle: UIViewController? {
        return visibleViewController
        //self.topViewController
    }
    
    override open var childForStatusBarHidden: UIViewController? {
        return visibleViewController
    }
}
