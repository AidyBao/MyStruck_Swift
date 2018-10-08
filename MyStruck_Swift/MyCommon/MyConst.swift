//
//  MyConst.swift
//  MyStruck_Swift
//
//  Created by 120v on 2018/10/8.
//  Copyright © 2018 MQ. All rights reserved.
//

import UIKit

import Foundation
import UIKit

let ZXBOUNDS_WIDTH      =   UIScreen.main.bounds.size.width
let ZXBOUNDS_HEIGHT     =   UIScreen.main.bounds.size.height

class ZX {
    
    static let PageSize:Int             =   12
    static let HUDDelay                 =   1.2
    static let CallDelay                =   0.5
    
    //定位失败 默认位置
    struct Location {
        static let latitude             =   30.592061
        static let longitude            =   104.063396
    }
}

/// 接口地址
class ZXURLConst {
    struct Api {
        static let url                  =   "http://115.182.15.118"
        static let port                 =   "8111"
        //测试
        //        static let url                  =   "http://192.168.0.171"
        //        static let port                 =   "80/aggInterface"
    }
    
    struct Resource {
        static let url                  =   "http://115.182.15.118"
        static let port                 =   "8118"
    }
    
    struct Web {
        static let about                =   "pages/about.html"                  //关于H5
        static let serviceItems         =   "pages/userAgreement.html"          //服务条款H5
    }
    
    struct WX {
        static let oauthAccessToken    =    "https://api.weixin.qq.com/sns/oauth2/access_token?" //获取授权access_token
        static let refreshAccessToken  =    "https://api.weixin.qq.com/sns/oauth2/refresh_token?" //刷新access_token
        static let verfifyAuth         =    "https://api.weixin.qq.com/sns/auth?"                 //检验授权凭证（access_token）是否有效
        static let getWXUserinfo       =    "https://api.weixin.qq.com/sns/userinfo?"              //获取用户个人信息
    }
}

/// 功能模块接口
class ZXAPIConst {
    struct System {
        static let time                 = "member/getServerTime"
    }
    
    struct FileResouce {
        static let url                  =   "agg/pages/uploadFileApp"             //文件上传接口
    }
    
    //MARK: - User
    struct User {
        static let getSMSCode    = "verificationCode/getSMSVerificationCode"  //获取验证码
        static let telLogin      = "member/loginByTel"                        //手机号登录
        static let WXLogin       = "member/loginByWX"                         //微信登录
        static let WXbinding     = "member/bindingWX"                         //微信绑定
        static let authTel       = "member/authTel"                           //验证手机号
        static let verCode       = "verificationCode/authVerificationCode"    //校验验证码
        //        static let memberVerCode       = "member/authVerificationCode"      //会员校验验证码
        static let verInviteCode = "inviteCode/authInviteCode"                //校验邀请码
        static let updateEqInfo  = "member/updateEquipmentInfo"               //更新设备信息
        static let getDictList   = "dict/getDictListByTypes"                  //1:年龄段 2:扣税说明 3:提现须知 4:游戏规则
        static let setSexAndAge  = "member/setSexAndAgeGroups"                //登录设置性别和年龄段
        static let memberInfo    = "member/getInfo"                           //获取用户信息
        static let getMemberInfo = "member/getMemberInfo"                     //根据二维码或者口令获取会员信息
        static let register      = "member/register"                          //注册
        static let autoLogin     = "member/autoLogin"                         //自动登录
        static let shareRecords  = "shareRecords/add"                         //新增分享记录
    }
}
