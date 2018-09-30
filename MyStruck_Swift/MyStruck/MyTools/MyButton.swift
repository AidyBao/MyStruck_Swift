//
//  MyButton.swift
//  MyStruck_Swift
//
//  Created by 120v on 2018/9/30.
//  Copyright © 2018 MQ. All rights reserved.
//

import UIKit

class MyButton: UIButton {
    //MARK: -
    
    /**圆角半径*/
    @IBInspectable var cornerRadius:CGFloat = 0.0{
        didSet{
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0 ? true : false;
        }
    }
    /**边框宽度*/
    @IBInspectable var borderWidth:CGFloat = 0.0 {
        didSet{
            layer.borderWidth = borderWidth
        }
    }
    /**边框颜色*/
    @IBInspectable var borderColor:UIColor?{
        didSet{
            layer.borderColor = borderColor?.cgColor
        }
    }
}
