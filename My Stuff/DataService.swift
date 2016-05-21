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
    
    var loadPosts: [Post] {
        return _loadedPosts
    }
    
    func savePosts() {
        // save data
        let postsData = NSKeyedArchiver.archivedDataWithRootObject(_loadedPosts)
        NSUserDefaults.standardUserDefaults().setObject(postsData, forKey: KEY_POSTS)
        
    }
    
    func loadPost() {
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
    func saveImageAndCreatePath(image: UIImage) {
        
    }
    
    // 找照片
    func imageForPath(path: String) {
        
    }
    
    // 新增照片之後要儲存和重新載入
    func addPost(post: Post) {
        _loadedPosts.append(post)
        savePosts()
        loadPost()
    }
    
    
    
    
}