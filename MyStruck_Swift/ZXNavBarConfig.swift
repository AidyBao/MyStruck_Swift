//
//  ZXNavBarConfig.swift
//  Test
//
//  Created by 120v on 2018/9/28.
//  Copyright © 2018 MQ. All rights reserved.
//

import UIKit

class ZXNavBarConfig: NSObject {
    static func active() {
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.isTranslucent = false
        navBarAppearance.barTintColor = UIColor.purple
        navBarAppearance.tintColor = UIColor.orange
        
        navBarAppearance.titleTextAttributes = {[NSAttributedString.Key.foregroundColor: UIColor.orange, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20)]}()
        
        navBarAppearance.shadowImage = UIImage()
        navBarAppearance.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
    }
}
