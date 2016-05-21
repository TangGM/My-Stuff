//
//  Post.swift
//  Amber Ann Collection
//
//  Created by Tang on 2016/5/21.
//  Copyright © 2016年 Tang. All rights reserved.
//

import Foundation

class Post {
    
    private var _imagePath: String // 下面有init，不用驚嘆號
    private var _title: String
    private var _postDesc: String
    
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
    
}