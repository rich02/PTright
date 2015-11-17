//
//  MyInjuriesTableViewController.swift
//  PTRight
//
//  Created by MU IT Program on 11/16/15.
//  Copyright © 2015 James Tapia. All rights reserved.
//

import UIKit

class MyInjuriesTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

           }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    

    /*override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }*/
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell! = tableView.dequeueReusableCellWithIdentifier("cell")
        
        cell.textLabel?.text = "Wrist Sprain"
        return cell
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
       
        /*tableView.reloadData()*/
    }

    

}
