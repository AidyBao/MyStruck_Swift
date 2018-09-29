//
//  MyCache.swift
//  MyStruck_Swift
//
//  Created by 120v on 2018/9/29.
//  Copyright © 2018 MQ. All rights reserved.
//

import UIKit

class MyCache: NSObject {
    
    /**
     * 读取缓存大小
     */
    static func returnCacheSize() -> String {
        return String(format: "%.2f",MyCache.forderSizeAtPath(folderPath: NSHomeDirectory() + "/Library/Caches"))
    }

    /**
     * 清除缓存
     */
    static func cleanCache(competion:@escaping ()->Void) {
        DispatchQueue.global(qos: .background).async {
            MyCache.deleteFolder(path: NSHomeDirectory() + "/Library/Caches")
            DispatchQueue.main.async {
                competion()
            }
        }
    }
    
    /**
     * 清除所有缓存
     */
    static func cleanAll(competion:@escaping ()->Void) {
        MyCache.deleteFolder(path: NSHomeDirectory() + "/Documents")
        MyCache.deleteFolder(path: NSHomeDirectory() + "/Library")
        MyCache.deleteFolder(path: NSHomeDirectory() + "/tmp")
        competion()
    }

    /**
     * 删除单个文件
     */
    static func deleteFolder(path: String) {
        let manage = FileManager.default
        if !manage.fileExists(atPath: path) {
            
        }
        let childFilePath = manage.subpaths(atPath: path)
        if let childFileList = childFilePath {
            for childPath in childFileList {
                let fileAbsoluePath = path + "/" + childPath
                do {
                    try manage.removeItem(atPath: fileAbsoluePath)
                } catch {
                    
                }
            }
        }
    }
    
    /**
     * 计算单个文件的大小
     */
    static func returnFileSize(path:String) -> Double {
        let manager = FileManager.default
        var fileSize: Double = 0
        do {
            let attr = try manager.attributesOfItem(atPath: path)
            fileSize = Double(attr[FileAttributeKey.size] as! UInt64)
            let dict = attr as NSDictionary
            fileSize = Double(dict.fileSize())
        } catch {
            dump(error)
        }
        return fileSize/1024/1024
    }
    
    /**
     * 遍历所有子目录， 并计算文件大小
     */
    static func forderSizeAtPath(folderPath:String) -> Double {
        let manage = FileManager.default
        if !manage.fileExists(atPath: folderPath) {
            return 0
        }
        let childFilePath = manage.subpaths(atPath: folderPath)
        var fileSize: Double = 0
        for path in childFilePath! {
            let fileAbsoluePath = folderPath + "/" + path
            fileSize += MyCache.returnFileSize(path: fileAbsoluePath)
        }
        return fileSize
    }
}
