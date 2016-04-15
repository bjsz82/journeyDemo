//
//  TrekkingViewController.swift
//  journayDemo
//
//  Created by Wang Weihan on 3/28/16.
//  Copyright © 2016 Wang Weihan. All rights reserved.
//

import UIKit

class TrekkingViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var myTableView: UITableView!
    
    let inProgressList = ["","","","",""]
    let futureList = ["","","","",""]
    let inProgressTitle = ["Appalacian Trail","Camino de Santiago","Cinque Terre","Great Wall","Inca Trail"]
    let inProgressdesc = ["United States","Spain","Italy","China","Peru"]
    let progress = [56.5,67,34,89.7,12.8]
    let futureimageTitle = ["Appalacian Trail","Camino de Santiago","Cinque Terre","Great Wall","Inca Trail"]
    let futureimagedesc = ["United States","Spain","Italy","China","Peru"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var valuecount = 0
        switch(segmentedControl.selectedSegmentIndex){
        case 0:
            valuecount = inProgressList.count
            break
        case 1:
            valuecount = futureList.count
            break
        default:
            break
        }
        return valuecount
    }
    func tableView(tableView: UITableView, sectionForSectionIndexTitle title: String, atIndex index: Int) -> Int {
        return 1;
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var myCell : UITableViewCell?
        
        if (segmentedControl.selectedSegmentIndex == 0) {
            // progress bar version of cell
            
            let myCell2 = tableView.dequeueReusableCellWithIdentifier("myCell2", forIndexPath: indexPath) as! MyCell2TableViewCell
            // do whatever you want on myCell1 knowing it is a MyCellTableViewCell
            //myCell1.
            myCell2.missionImage2.image = UIImage(named: "trail\(indexPath.row).jpg")
            myCell2.imageTitle2?.text = futureimageTitle[indexPath.row]
            myCell2.imageDescription2?.text = futureimagedesc[indexPath.row]
            myCell2.progressview.progress = Float(progress[indexPath.row]/100)
            myCell = myCell2
            
        } else {


            let myCell1 = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath) as! MyCellTableViewCell
            // do whatever you want on myCell1 knowing it is a MyCellTableViewCell
            //myCell1.
            myCell1.missionImage.image = UIImage(named: "trail\(indexPath.row).jpg")
            myCell1.imageTitle?.text = futureimageTitle[indexPath.row]
            myCell1.imageDescription?.text = futureimagedesc[indexPath.row]
            myCell1.accessoryType = .DisclosureIndicator
            myCell = myCell1
        }
        
        
        return myCell!
        
        /*
        
        var myCell
        if(segmentedControl.selectedSegmentIndex == 0){
             myCell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath) as! MyCellTableViewCell
        } else{
            myCell = tableView.dequeueReusableCellWithIdentifier("myCell2", forIndexPath: indexPath) as! MyCellTableViewCell
        }
        /*let myCell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath) as! MyCellTableViewCell*/
        
        //myCell.missionImage.image = UIImage(named: "trail\(indexPath.row).jpg")
        
        switch(segmentedControl.selectedSegmentIndex){
        case 0:
            myCell.textLabel?.text = InProgressList[indexPath.row]
            break
        case 1:
            //myCell.textLabel?.text = FutureList[indexPath.row]
            myCell.missionImage.image = UIImage(named: "trail\(indexPath.row).jpg")
            myCell.imageTitle?.text = futureimageTitle[indexPath.row]
            myCell.imageDescription?.text = futureimagedesc[indexPath.row]
            break
        default:
            break
        }
        myCell.accessoryType = .DisclosureIndicator
        return myCell
*/
    }
   
    @IBAction func shareAction(sender: AnyObject) {
        let myShare = "Say something about this photo..."
        
        let activityViewController: UIActivityViewController = UIActivityViewController(activityItems: [myShare], applicationActivities: nil)
        
        self.presentViewController(activityViewController, animated: true, completion: nil)
        
    }
   override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let destinationController = segue.destinationViewController as? Trekking2ViewController {
            
            destinationController.myTitle = futureimageTitle[myTableView.indexPathForSelectedRow!.row]
            
        }

    }
    
    @IBAction func segmentedControllAction(sender: AnyObject) {
        myTableView.reloadData()
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
