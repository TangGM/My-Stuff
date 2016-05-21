//
//  Post.swift
//  Amber Ann Collection
//
//  Created by Tang on 2016/5/21.
//  Copyright © 2016年 Tang. All rights reserved.
//

import Foundation

// NSUerDefaults 一定要繼承這兩個類別
class Post: NSObject, NSCoding {
    
    private var _imagePath: String! // 下面有init，不用驚嘆號 // 但decodeObjectForkey需要驚嘆號 = =
    private var _title: String!
    private var _postDesc: String!
    
    var imagePath: String {
        return _imagePath
    }
    
    var title: String {
        return _title
    }
    
    var postDesc: String {
        return _postDesc
    }
    
    init(imagePath: String, title: String, decription: String){
        self._imagePath = imagePath
        self._title = title
        self._postDesc = decription
    }
    
    
    // NSObject NSCoding 需要這些init，並且設定好解壓縮格式
    override init() {
        
    }
    
    // 解密檔案
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        // 當別處要解壓縮這個檔案時，告訴他如何解壓縮
        self._imagePath = aDecoder.decodeObjectForKey("imagePath") as? String
        self._title = aDecoder.decodeObjectForKey("title") as? String
        self._postDesc = aDecoder.decodeObjectForKey("decription") as? String
    }
    
    // 加密檔案
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self._imagePath, forKey: "imagePath")
        aCoder.encodeObject(self._title, forKey: "title")
        aCoder.encodeObject(self._postDesc, forKey: "decription")
    }
}