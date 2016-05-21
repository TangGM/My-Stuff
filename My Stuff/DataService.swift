//
//  DataService.swift
//  My Stuff
//
//  Created by Tang on 2016/5/21.
//  Copyright © 2016年 Tang. All rights reserved.
//

import Foundation
import UIKit

class DataService {
    // static表示永遠只會有這一個實體
    static let instance = DataService()
    
    let KEY_POSTS = "posts"
    private var _loadedPosts = [Post]()
    
    var loadedPosts: [Post] {
        return _loadedPosts
    }
    
    func savePosts() {
        // save data
        let postsData = NSKeyedArchiver.archivedDataWithRootObject(_loadedPosts)
        NSUserDefaults.standardUserDefaults().setObject(postsData, forKey: KEY_POSTS)
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    func loadPosts() {
        // grap data
        if let postsData = NSUserDefaults.standardUserDefaults().objectForKey(KEY_POSTS) as? NSData {
            // 解壓縮成可使用的資料
            if let postArray = NSKeyedUnarchiver.unarchiveObjectWithData(postsData) as? [Post] {
                _loadedPosts = postArray
            }
        }
        
        // 讓 viewcontroller 知道
        NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "postsLoaded", object: nil))

    }
    
    // 儲存照片
    func saveImageAndCreatePath(image: UIImage) -> String{
        // 將使用者的照片轉換成PNG的檔案格式，才能壓縮處理
        let imgData = UIImagePNGRepresentation(image)
        // 每個照片檔名要unique，所以直接用時間來命名
        let imgPath = "image\(NSDate.timeIntervalSinceReferenceDate()).png"
        let fullPath = documentsPathForFileName(imgPath)
        
        // 寫入檔案，atomically是安全作法
        imgData?.writeToFile(fullPath, atomically: true)
        // 如果用fullPath其他地方會無法辨識檔案，所以直接回傳imgPath（檔名）就好
        return imgPath
    }
    
    // 找照片
    func imageForPath(path: String) -> UIImage? {
        let fullPath = documentsPathForFileName(path)
        let image = UIImage(named: fullPath)
        return image
    }
    
    // 新增照片之後要儲存和重新載入
    func addPost(post: Post) {
        _loadedPosts.append(post)
        savePosts()
        loadPosts()
    }
    
    // 圖片會存在documents資料夾，不是NSUserDefaults
    func documentsPathForFileName(name: String) -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let fullPath = paths[0] as NSString // NSString可以append
        return fullPath.stringByAppendingPathComponent(name)
    }
    
    
}