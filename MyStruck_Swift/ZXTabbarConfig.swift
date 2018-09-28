//
//  ZXTabbarConfig.swift
//  Test
//
//  Created by 120v on 2018/9/28.
//  Copyright © 2018 MQ. All rights reserved.
//

import UIKit

class ZXTabbarConfig: NSObject {
    static func active() {
        let tabBarAppearance = UITabBar.appearance()
        tabBarAppearance.isTranslucent = true
        tabBarAppearance.barTintColor = UIColor.black
        
        let tabBarItem = UITabBarItem.appearance()
    tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
        tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.orange], for: .selected)
        
    }
}
