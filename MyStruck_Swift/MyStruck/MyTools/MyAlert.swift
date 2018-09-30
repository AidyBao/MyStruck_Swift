//
//  MyAlert.swift
//  MyStruck_Swift
//
//  Created by 120v on 2018/9/30.
//  Copyright © 2018 MQ. All rights reserved.
//

import UIKit

class MyAlert: NSObject {
    class func showAlert(withTitle title:String?,
                         message:String?) {
        let aTitle = title ?? "提示"
        let alert = UIAlertController.init(title: aTitle, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "确定", style: .default, handler: nil))
        UIViewController.zx_keyController().present(alert, animated: true, completion: nil)
    }
    
    class func showAlert(wihtTitle title:String?,
                         message:String?,
                         buttonText:String?,
                         action:(()->Void)?) {
        let aTitle = title ?? "提示"
        let alert = UIAlertController.init(title: aTitle, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: buttonText ?? "确定", style: .default) { (_) in
            action?()
        })
        UIViewController.zx_keyController().present(alert, animated: true, completion: nil)
    }
    
    class func showAlert(wihtTitle title:String?,
                         message:String?,
                         buttonTexts:Array<String>,
                         action:((Int)->Void)?) {
        let aTitle = title ?? "提示"
        let alert = UIAlertController.init(title: aTitle, message: message, preferredStyle: .alert)
        for text in buttonTexts {
            alert.addAction(UIAlertAction.init(title: text , style: .default) { (alertAction) in
                let title = alertAction.title
                let index = buttonTexts.index(of: title!) ?? -999
                action?(index)
            })
        }
        UIViewController.zx_keyController().present(alert, animated: true, completion: nil)
    }
    
    class func showActionSheet(withTitle title:String?,
                               message:String?,
                               buttonTexts:Array<String>,
                               cancelText:String?,
                               sender: UIView?,
                               action:((Int)->Void)?) {
        let aTitle = title ?? "提示"
        let alert = UIAlertController.init(title: aTitle, message: message, preferredStyle: .actionSheet)
        for text in buttonTexts {
            alert.addAction(UIAlertAction.init(title: text , style: .default) { (alertAction) in
                let title = alertAction.title
                let index = buttonTexts.index(of: title!) ?? -999
                action?(index)
            })
        }
        alert.addAction(UIAlertAction.init(title: cancelText ?? "取消", style: .cancel, handler: nil))
        if let popoverController = alert.popoverPresentationController,let sender = sender {
            popoverController.sourceView = sender
            popoverController.sourceRect = sender.bounds
        }
        //tag += 1
        UIViewController.zx_keyController().present(alert, animated: true, completion: nil)
    }
}
