//
//  UITabBarController.swift
//  Test
//
//  Created by 120v on 2018/9/28.
//  Copyright © 2018 MQ. All rights reserved.
//

import UIKit

class ZX_XXNavigationController: UINavigationController {
    //override func pushViewController(_ viewController: UIViewController, animated: Bool) {
    //    viewController.zx_clearNavbarBackButtonTitle()
    //    super.pushViewController(viewController, animated: animated)
    //}
    
    override func setViewControllers(_ viewControllers: [UIViewController], animated: Bool) {
        for (idx,vc) in viewControllers.enumerated() {
            if idx != 0 {

            }
        }
        super.setViewControllers(viewControllers, animated: animated)
    }
    
}

extension UITabBarController {
    final func zx_addChildViewController(_ controller:UIViewController!) {
        var normalImage = UIImage.init()
        normalImage     = normalImage.withRenderingMode(.alwaysOriginal)
        
        var selectedImage   = UIImage.init()
        selectedImage       = selectedImage.withRenderingMode(.alwaysOriginal)
        
        controller.tabBarItem.image = UIImage()
        controller.tabBarItem.selectedImage = UIImage()
        controller.tabBarItem.title = "我的"

         let nav = ZX_XXNavigationController.init(rootViewController: controller)
        nav.tabBarItem.title = "我的"
        self.addChild(nav)
    }
    
    final func zx_addChildViewController(_ controller:UIViewController!,fromPlistItemIndex index:Int) {
        zx_addChildViewController(controller)
    }
    
    final func xxx_addChileViewController(_ controller:UIViewController!) {
        var normalImage = UIImage.init()
        normalImage     = normalImage.withRenderingMode(.alwaysOriginal)
        
        var selectedImage   = UIImage.init()
        selectedImage       = selectedImage.withRenderingMode(.alwaysOriginal)
        
        controller.tabBarItem.image = UIImage()
        controller.tabBarItem.selectedImage = UIImage()
        controller.tabBarItem.title = "我的"
        
        self.addChild(controller)
    }
}
