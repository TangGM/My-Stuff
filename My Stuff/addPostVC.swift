//
//  addPostVC.swift
//  My Stuff
//
//  Created by Tang on 2016/5/21.
//  Copyright © 2016年 Tang. All rights reserved.
//

import UIKit

// use image need 2 protocals
class AddPostVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var titleField: UITextField!
    @IBOutlet var descField: UITextField!
    @IBOutlet var postImg: UIImageView!
    
    var imagePicker: UIImagePickerController!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postImg.layer.cornerRadius = postImg.frame.size.width / 2 // make a circle
        postImg.clipsToBounds = true // cut the img
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
    }

    
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        postImg.image = image
        
    }
    
    
    

    @IBAction func cancelBtnPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func addPostBtnPressed(sender: UIButton!) {
        // 讓按鈕消失
        sender.setTitle("", forState: .Normal)
        // UIImagePickerControler屬於一種ViewController，這邊用imagePiceker實體化
        presentViewController(imagePicker, animated: true, completion: nil)
        
    }

    @IBAction func makePostBtnPressed(sender: AnyObject) {
        
        if let title = titleField.text, let desc = descField.text, img = postImg.image {
            
        }
        
    }
}
