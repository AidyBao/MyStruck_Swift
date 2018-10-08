//
//  String+ZX.swift
//  ZXStructs
//
//  Created by JuanFelix on 2017/3/31.
//  Copyright © 2017年 screson. All rights reserved.
//

import Foundation
import UIKit

let PASSWORD_REG    = "^(?![^a-zA-Z]+$)(?!\\D+$).{6,20}$" //6-20位字母+数字
let MOBILE_REG      = "[1]\\d{10}$"
let EMAIL_REG       = "\\b([a-zA-Z0-9%_.+\\-]+)@([a-zA-Z0-9.\\-]+?\\.[a-zA-Z]{2,6})\\b"
let CHINESE_REG     = "(^[\\u4e00-\\u9fa5]+$)"
let VALID_REG     = "[\\u4E00-\\u9FA5A-Za-z0-9_]+$"

//可使用汉字、英文、数字及下划线,不包含汉字符合、英文符号
let ZXNikeName_REG = "(^[\\u4E00-\\u9FA5A-Za-z0-9_]+$)"

//返回包含汉字、英文、数字、不包括标点符号的字符串
let ZXSearchKey_REG = "[^\\u4e00-\\u9fa5A-Za-z0-9]"

//邀请码规则(8位字母或数字组成，规则：*A***G**、*G***A**、*G***G**)
let ZXIsInviteCode_REG = "^[A-Z0-9][AG][A-Z0-9]{3}[AG][A-Z0-9]{2}$"
//包含邀请码规则(8位字母或数字组成，规则：*A***G**、*G***A**、*G***G**)
let ZXContainInviteCode_REG = "^.*[A-Z0-9][AG][A-Z0-9]{3}[AG][A-Z0-9]{2}$"
//包含添加好友口令规则（已确认，#爱口令#长按复制此消息，打卡爱广告即可添加我为好友*A***G**J*、*A***G**H*、*A***G**Y*、*G***A**J*、*G***A**H*、*G***A**Y*、*G***G**J*、*G***G**H*、*G***G**Y*）
let ZXContainAddFriend_REG = "^.*[A-Z0-9][AG][A-Z0-9]{3}[AG][A-Z0-9]{2}[JHY][A-Z0-9]$"

extension String {
    func index(at: Int) -> Index {
        return self.index(startIndex, offsetBy: at)
    }
    
    func substring(from: Int) -> String {
        let fromIndex = index(at: from)
        return substring(from: fromIndex)
    }
    
    func substring(to: Int) -> String {
        let toIndex = index(at: to)
        return substring(to: toIndex)
    }
    
    func substring(with r:Range<Int>) -> String {
        let startIndex  = index(at: r.lowerBound)
        let endIndex    = index(at: r.upperBound)
        return substring(with: startIndex..<endIndex)
    }
    
    func zx_trimSpace() -> String {
        var str = self
        str = str.trimmingCharacters(in: .whitespaces)
        str = str.replacingOccurrences(of: " ", with: "")
        return str
    }
}

extension String {
    func zx_matchs(regularString mstr:String) -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@",mstr)
        return predicate.evaluate(with:self)
    }
    
    func zx_passwordValid() -> Bool {
        return zx_matchs(regularString: PASSWORD_REG)
    }
    
    func zx_mobileValid() -> Bool {
        return zx_matchs(regularString: MOBILE_REG)
    }
    
    func zx_emailValid() -> Bool {
        return zx_matchs(regularString: EMAIL_REG)
    }
    
    func zx_isChinese() -> Bool {
        return zx_matchs(regularString: CHINESE_REG)
    }
    
    func zx_inValidText() -> Bool {
        return !zx_matchs(regularString: VALID_REG)
    }
    
    public func zx_predicateNickname() -> Bool {
        return zx_matchs(regularString: ZXNikeName_REG)
    }
    
    public func zx_predicateSearch() -> String {
        let str = self.replacingOccurrences(of: ZXSearchKey_REG, with: "", options: .regularExpression, range: nil)
        return str
    }
    
    //是否包含汉字、英文、数字、不包括标点符号
    public func zx_predicateSearchForBool() -> Bool {
        return zx_matchs(regularString: ZXSearchKey_REG)
    }
    
    //是否是邀请码规则
    public func zx_isInviteCode() -> Bool {
        return zx_matchs(regularString: ZXIsInviteCode_REG)
    }
    
    //是否包含邀请码规则
    public func zx_isContainInviteCode() -> Bool {
        return zx_matchs(regularString: ZXContainInviteCode_REG)
    }
    
    //包含添加好友规则
    public func zx_isContainAddFriendCode() -> Bool {
        return zx_matchs(regularString: ZXContainAddFriend_REG)
    }
    
    func zx_textRectSize(toFont font:UIFont,limiteSize:CGSize) -> CGSize {
        let size = (self as NSString).boundingRect(with: limiteSize, options: NSStringDrawingOptions(rawValue: NSStringDrawingOptions.usesLineFragmentOrigin.rawValue|NSStringDrawingOptions.truncatesLastVisibleLine.rawValue), attributes: [NSAttributedString.Key.font:font], context: nil).size
        return size
    }
    
    func zx_noticeName() -> NSNotification.Name {
        return NSNotification.Name.init(self)
    }
    
    func zx_telSecury() -> String {
        if self.zx_mobileValid() {
            let head = self.substring(with: 0..<3)
            let tail = self.substring(with: (self.count - 4)..<self.count)
            return "\(head)****\(tail)"
        } else {
            return self
        }
    }
    
    mutating func zx_insertSpace(at index: Int) -> String {
        var str = self
        if index < str.count {
            str.insert(" ", at: str.index(at: index))
            return str
        }
        return str
    }
    
    func zx_priceFormat(_ fontName:String,size:CGFloat,bigSize:CGFloat,color:UIColor) -> NSMutableAttributedString {
        let price = self.zx_priceString()
        let aRange = NSMakeRange(0, price.count)//¥ + 小数部分
        var pRange = NSMakeRange(1, price.count)//整数部分
        
        let location = (price as NSString).range(of: ".")
        if  location.length > 0 {
            pRange = NSMakeRange(1, location.location)//整数部分
        }
        
        let formatPrice = NSAttributedString.zx_colorFormat(price, color: color, at: aRange)
        
        formatPrice.zx_appendFont(font: UIFont(name: fontName, size: size) ?? UIFont.systemFont(ofSize: size), at: aRange)
        formatPrice.zx_appendFont(font: UIFont(name: fontName, size: bigSize) ?? UIFont.systemFont(ofSize: bigSize), at: pRange)
        
        return formatPrice
    }
    
    func zx_priceFormat(color:UIColor?) -> NSMutableAttributedString {
        return self.zx_priceFormat("15", size: 15, bigSize: 20, color: color ?? UIColor.red)
    }
    
    func zx_priceString(_ unit:Bool = false,_ clipRadixPointIfInt: Bool = false, yuan: Bool = true) -> String {
        var price = self
        if price.count <= 0 {
            price = "0"
        }
        let location = (price as NSString).range(of: ".")
        if  location.length <= 0 {
            price += ".00"
        } else if (price.count - 1 - location.location) < 2 {
            price += "0"
        }
        price = price.replacingOccurrences(of: "(?<=\\d)(?=(\\d\\d\\d)+(?!\\d))", with: ",", options: .regularExpression, range: price.startIndex..<price.endIndex)
        
        if clipRadixPointIfInt {
            price = price.replacingOccurrences(of: ".00", with: "")
        }
        
        if unit {
            if !price.hasPrefix("¥") {
                return "¥\(price)"
            }
        } else {
            if price.hasPrefix("¥") {
                return price.substring(from: 1)
            }
        }
        if yuan {
            return "\(price)元"
        }
        return price
    }
    
    func zx_pinyin(removeSpace: Bool = false)->String{
        let mutableString = NSMutableString(string: self)
        CFStringTransform(mutableString, nil, kCFStringTransformToLatin, false)
        CFStringTransform(mutableString, nil, kCFStringTransformStripDiacritics, false)
        let string = String(mutableString)
        if removeSpace {
            return string.lowercased().replacingOccurrences(of: " ", with: "")
        } else {
            return string
        }
    }
    
    func zx_capitalPinyin(removeSpace: Bool = false)->String{
        let mutableString = NSMutableString(string: self)
        CFStringTransform(mutableString, nil, kCFStringTransformToLatin, false)
        CFStringTransform(mutableString, nil, kCFStringTransformStripDiacritics, false)
        let string = String(mutableString)
        if removeSpace {
            return string.capitalized.replacingOccurrences(of: " ", with: "")
        } else {
            return string
        }
    }
    
    func zx_BigImage() -> String {
        return self.replacingOccurrences(of: "_smart", with: "")
    }
    
    func zx_htmlAttr(color: UIColor? = nil, font: UIFont? = nil) -> NSAttributedString? {
        if let data = self.data(using: .unicode, allowLossyConversion: true) {
            do {
                let attr = try NSMutableAttributedString.init(data: data, options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil)
                if let color = color {
                    attr.zx_appendColor(color: color, at: NSMakeRange(0, attr.length))
                }
                if let font = font {
                    attr.zx_appendFont(font: font, at: NSMakeRange(0, attr.length))
                }
                return attr
            } catch {
                return nil
            }
        }
        return nil
    }
    
    //MARK: - html图片自适应
    func zx_htmlStyle() -> String {
        var sourceStr = self.replacingOccurrences(of: "&amp;quot", with: "'")
        sourceStr = sourceStr.replacingOccurrences(of: "&lt;", with: "<")
        sourceStr = sourceStr.replacingOccurrences(of: "&gt;", with: ">")
        sourceStr = sourceStr.replacingOccurrences(of: "&quot;", with: "\"")
        let htmlStr =
                "<html> \n" +
                "<head> \n" +
                "<style type=\"text/css\"> \n" +
                "body {font-size:15px;}\n" +
                "</style> \n" +
                "</head> \n" +
                "<body><script type='text/javascript'>window.onload = function(){\n" +
                "var $img = document.getElementsByTagName('img');\n" +
                "for(var p in  $img){\n" +
                "$img[p].style.width = '100%%';\n" +
                "$img[p].style.height ='auto'\n" +
                "}\n" +
                "}</script>\(sourceStr)</body></html>"
        return htmlStr
    }
    
    func zx_isEmpty() -> Bool {
        var str = self
        str = str.trimmingCharacters(in: .whitespacesAndNewlines)
        if str.count > 0 {
            return false
        }
        return true
    }
    
    func zx_trimming(_ charset: CharacterSet = .whitespacesAndNewlines) -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    //千分位格式
    static func zx_separatedString(char: Int) -> String {
        let format = NumberFormatter()
        format.positiveFormat = "###,##0"
        if let str = format.string(from: NSNumber.init(value:char)) {
            return str
        }
        return ""
    }
}

extension NSNumber {
    func zx_priceString(unit:Bool = false,yuan: Bool = true) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        var str = formatter.string(from: self) ?? "0.00"
        str = str.replacingOccurrences(of: "^[^\\d]*", with: unit ? "¥" : "", options: .regularExpression, range: str.startIndex..<str.endIndex)
        if yuan {
            return "\(str)元"
        }
        return str
    }
}
