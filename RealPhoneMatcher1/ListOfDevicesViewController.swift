//
//  Question1SecondViewController.swift
//  RealPhoneMatcher1
//
//  Created by Krish Avvari on 7/17/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
import MGSwipeTableCell

class ListOfDevicesTableViewController : UITableViewController {
    var deviceLabel: String = ""
    var brandLabel: String = ""
    var statusLabel: String = ""
    var dimensionsLabel: String = ""
    var weightLabel = ""
    var resolutionLabel = ""
    var featuresLabel = ""
    var colorsLabel = ""
    var talkTimeLabel = ""
    var sizeLabel = ""
    var realDevices5: [JSON] = []
    @IBOutlet var swipeToView: UISwipeGestureRecognizer!
    
    @IBAction func didSwipe(_ sender: UISwipeGestureRecognizer) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let reuseIdentifier = "listOfDevicesTableViewCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! MGSwipeTableCell
        cell.textLabel?.textColor = UIColor.orange
             cell.textLabel!.text = realDevices5[indexPath.row]["DeviceName"].stringValue
        cell.leftButtons = [MGSwipeButton(title: "", icon: UIImage(named:"amazonlogo.png"), backgroundColor: .white) { (sender: MGSwipeTableCell!) -> Bool in
            print ("Amazon button clicked")
            return true}]
        return cell
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return realDevices5.count
    }
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "listOfDevicesTableViewCell", for: indexPath)
//        cell.textLabel?.textColor = UIColor.orange
//        cell.textLabel?.text = realDevices5[indexPath.row]["DeviceName"].stringValue
//        return cell
//    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        deviceLabel = realDevices5[indexPath.row]["DeviceName"].stringValue
        brandLabel = realDevices5[indexPath.row]["Brand"].stringValue
        statusLabel = realDevices5[indexPath.row]["status"].stringValue
        dimensionsLabel = realDevices5[indexPath.row]["dimensions"].stringValue
        weightLabel = realDevices5[indexPath.row]["weight"].stringValue
        resolutionLabel = realDevices5[indexPath.row]["resolution"].stringValue
        featuresLabel = realDevices5[indexPath.row]["features_c"].stringValue
        colorsLabel = realDevices5[indexPath.row]["colors"].stringValue
        talkTimeLabel = realDevices5[indexPath.row]["talk_time"].stringValue
        sizeLabel = realDevices5[indexPath.row]["size"].stringValue
        // Segue to the second view controller
        self.performSegue(withIdentifier: "segueToProperties", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // get a reference to the second view controller
        if segue.identifier == "segueToProperties" {
            if let sixthViewController = segue.destination as? TestViewController {
                // set a variable in the second view controller with the data to pass
                sixthViewController.deviceNameLabel = deviceLabel
                sixthViewController.brandNameLabel = brandLabel
                sixthViewController.statusNameLabel = statusLabel
                sixthViewController.dimensionsNameLabel = dimensionsLabel
                sixthViewController.weightNameLabel = weightLabel
                sixthViewController.resolutionNameLabel = resolutionLabel
                sixthViewController.featuresNameLabel = featuresLabel
                sixthViewController.colorsNameLabel = colorsLabel
                sixthViewController.talkTimeNameLabel = talkTimeLabel
                sixthViewController.sizeNameLabel = sizeLabel
            }
        }
    }
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        realDevices5.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        
        return UITableViewCellEditingStyle.none
        
    }
    
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        
        return false
        
    }
//    func didSwipe(gestureRecognizer:UIGestureRecognizer) {
//        if gestureRecognizer.state == UIGestureRecognizerState.ended {
//            let swipeLocation = gestureRecognizer.location(in: self.tableView)
//            if let swipedIndexPath = self.tableView.indexPathForRow(at: swipeLocation){
//                if let swipedCell = self.tableView.cellForRow(at: swipedIndexPath){
//                    
//                    
//                }
//            }
//        }
//    }
//    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
//        let delete = UITableViewRowAction(style: .default, title: "Delete") { (action:UITableViewRowAction, indexPath:IndexPath) in
//            print("delete at:\(indexPath)")
//        }
//        delete.backgroundColor = .red
//        
//        let more = UITableViewRowAction(style: .default, title: "More") { (action:UITableViewRowAction, indexPath:IndexPath) in
//            print("more at:\(indexPath)")
//        }
//        more.backgroundColor = .orange
//        
//        return [delete, more]
//    }
    
    
    

    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
