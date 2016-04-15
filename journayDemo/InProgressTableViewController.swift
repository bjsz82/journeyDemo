//
//  InProgressTableViewController.swift
//  journayDemo
//
//  Created by Wang Weihan on 4/6/16.
//  Copyright © 2016 Wang Weihan. All rights reserved.
//

import UIKit
import MapKit

class InProgressTableViewController: UITableViewController, UICollectionViewDelegate, UICollectionViewDataSource  {
    
    var photosCollectionView: UICollectionView?
    let numImages = 10
    var imageList = [String]()
    var str = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for index in 0...(numImages-1) {
            imageList.append("trail\(index%4).jpg")
        }

    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numImages
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("photocell", forIndexPath: indexPath)
        
        let imageView = cell.viewWithTag(1) as! UIImageView
        
        imageView.image = UIImage(named: imageList[indexPath.item])
        
        return cell
    }

    
    
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let incell = tableView.dequeueReusableCellWithIdentifier("inprogress_cell", forIndexPath: indexPath) as! MapViewTableViewCell
        
        photosCollectionView = incell.photosCollectionView

        return incell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let destinationController = segue.destinationViewController as? ImageCollectionViewController {
            
            //destinationController.imageList2 = str
            
            let selectedItemsIndexPaths = photosCollectionView?.indexPathsForSelectedItems()
            if (selectedItemsIndexPaths!.count > 0) {
                if let indexPath = selectedItemsIndexPaths?.first {
                    destinationController.imageList2 = imageList[indexPath.row]
                }
            }
                
        }
        
    }
    /*
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        str = imageList[indexPath.item]
        
    }
 */
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
