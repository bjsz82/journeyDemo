//
//  ImageCollectionViewController.swift
//  journayDemo
//
//  Created by Wang Weihan on 4/7/16.
//  Copyright © 2016 Wang Weihan. All rights reserved.
//

import UIKit

class ImageCollectionViewController: UIViewController {

    @IBOutlet weak var selectedImage: UIImageView!
    
    var imageList2 = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        selectedImage.image = UIImage(named: imageList2)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
