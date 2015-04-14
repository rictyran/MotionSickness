//
//  TableViewController.swift
//  MotionSickness
//
//  Created by Richard Tyran on 2/16/15.
//  Copyright (c) 2015 Richard Tyran. All rights reserved.
//

import UIKit
import CoreMotion

func roundToDecimal(d: Double, places: Double) -> Double {
    
    let placeValue = pow(10, places)
    
    return round(d * placeValue) / placeValue
    
}


class TableViewController: UITableViewController {
    
    @IBOutlet var rotationZLabel: UILabel!
    @IBOutlet var rotationXLabel: UILabel!
    @IBOutlet var rotationYLabel: UILabel!
    
    @IBOutlet var accelerationZLabel: UILabel!
    @IBOutlet var accelerationXLabel: UILabel!
    @IBOutlet var accelerationYLabel: UILabel!
    
    @IBOutlet var attitudeYawLabel: UILabel!
    @IBOutlet var attitudePitchLabel: UILabel!
    @IBOutlet var attitudeRollLabel: UILabel!
    
    @IBOutlet var rotationXYView: DeltaView!
    @IBOutlet var rotationXZView: DeltaView!
    @IBOutlet var rotationZYView: DeltaView!
    
    var motionManager = CMMotionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        motionManager.startDeviceMotionUpdatesToQueue(NSOperationQueue.mainQueue(), withHandler: { (deviceMotion, error) -> Void in
            
            let rotation = deviceMotion.rotationRate
            let attitude = deviceMotion.attitude
            let acceleration = deviceMotion.userAcceleration
            
            //            self.rotationXYView.deltaPoint = (CGFloat(rotation.x),CGFloat(rotation.y))
            //            self.rotationXZView.deltaPoint = (CGFloat(rotation.x),CGFloat(rotation.z))
            //            self.rotationZYView.deltaPoint = (CGFloat(rotation.z),CGFloat(rotation.y))
            
            //            self.rotationXYView.deltaPoint = (CGFloat(acceleration.x),CGFloat(acceleration.y))
            //            self.rotationXZView.deltaPoint = (CGFloat(acceleration.x),CGFloat(acceleration.z))
            //            self.rotationZYView.deltaPoint = (CGFloat(acceleration.z),CGFloat(acceleration.y))
            
            self.rotationXYView.deltaPoint = (CGFloat(attitude.pitch * 10),CGFloat(attitude.roll * 10))
            self.rotationXZView.deltaPoint = (CGFloat(attitude.pitch * 10),CGFloat(attitude.yaw * 10))
            self.rotationZYView.deltaPoint = (CGFloat(attitude.yaw * 10),CGFloat(attitude.roll * 10))
            
            self.rotationXLabel.text = "x: \(roundToDecimal(rotation.x, 2))"
            self.rotationYLabel.text = "y: \(roundToDecimal(rotation.y, 2))"
            self.rotationZLabel.text = "z: \(roundToDecimal(rotation.z, 2))"
            
            
            println("rotation x \(round(rotation.x * 100) / 100) y \(round(rotation.y * 100) / 100) z \(round(rotation.z * 100) / 100) ")
            
        })
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    //    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    //        // #warning Potentially incomplete method implementation.
    //        // Return the number of sections.
    //        return 0
    //    }
    //
    //    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //        // #warning Incomplete method implementation.
    //        // Return the number of rows in the section.
    //        return 0
    //    }
    
    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as UITableViewCell
    
    // Configure the cell...
    
    return cell
    }
    */
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return NO if you do not want the specified item to be editable.
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
    // Return NO if you do not want the item to be re-orderable.
    return true
    }
    */
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    }
    */
    
}
