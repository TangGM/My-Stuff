//
//  ViewController.swift
//  My Stuff
//
//  Created by Tang on 2016/5/21.
//  Copyright © 2016年 Tang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
/*
        more flexible way to set cell's row height:
        tableView.estimatedRowHeight = 87.0
*/
        
        // 來知道 DataService 發出的 notification。
        // observer：傾聽通知的類別，self自己。selector：要呼叫的函數，有參數記得加分號。name：接收的通知名稱。
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "onPosstLoaded:", name: "postsLoaded", object: nil)
        
        
    
    }
    

    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let post = DataService.instance.loadPosts[indexPath.row]
        if let cell = tableView.dequeueReusableCellWithIdentifier("PostCell") as? PostCell { // 需要轉型
            cell.configureCell(post)
            return cell
        } else {
            // 避免抓不到的情況，自己做一個cell
            let cell = PostCell()
            cell.configureCell(post)
            return cell
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 87.0
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.loadPosts.count
    }
    
//    點選row之後要做的事
//    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
//        <#code#>
//    }
    
    func onPostsLoaded(notif: AnyObject) {
        tableView.reloadData()
    }

}

