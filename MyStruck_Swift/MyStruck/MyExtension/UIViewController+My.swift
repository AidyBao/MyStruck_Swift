//
//  UIViewController+My.swift
//  MyStruck_Swift
//
//  Created by 120v on 2018/9/30.
//  Copyright © 2018 MQ. All rights reserved.
//

import UIKit

extension UIViewController {
    
    //MARK: - Common
    class func zx_keyController() -> UIViewController! {
        var keyVC = UIApplication.shared.keyWindow?.rootViewController
        repeat{
            if let presentedVC = keyVC?.presentedViewController {
                keyVC = presentedVC
            }else {
                break
            }
        } while ((keyVC?.presentedViewController) != nil)
        return keyVC
    }
    
    //MARK: -
    func zx_refresh() {
        
    }
    
    func zx_loadmore() {
        
    }
}
