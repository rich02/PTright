//
//  MyInjuriesViewController.swift
//  PTRight
//
//  Created by MU IT Program on 12/2/15.
//  Copyright © 2015 James Tapia. All rights reserved.
//

import UIKit

class MyInjuriesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell! = tableView.dequeueReusableCellWithIdentifier("injuries")
        
        cell.textLabel?.text = "Wrist Sprain"
        return cell
        
    }

}
