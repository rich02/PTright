//
//  AddInjuryViewController.swift
//  PTRight
//
//  Created by MU IT Program on 11/16/15.
//  Copyright © 2015 James Tapia. All rights reserved.
//

import UIKit

enum InjurySections: Int, CustomStringConvertible {
    case Name, Description, Prevention, Severity, Date, Count
    
    var description: String {
        switch (self) {
        case .Name: return "Name"
        case .Description: return "Description"
        case .Prevention: return "Prevention"
        case .Severity: return "Severity"
        case .Date: return "Date"
        case .Count: return "Count"
        }
    }
}

class AddInjuryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return InjurySections.Count.rawValue
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let tableViewSections = InjurySections(rawValue: section) {
            switch tableViewSections {
            case .Name, .Description, .Prevention, .Severity, .Date:
                return 1
            default:
                break
            }
        }
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch indexPath.section {
        case InjurySections.Name.rawValue:
            let nameCell = tableView.dequeueReusableCellWithIdentifier("injuryName", forIndexPath: indexPath) as! InjuryNameTableViewCell
            return nameCell
        case InjurySections.Description.rawValue:
            let descCell = tableView.dequeueReusableCellWithIdentifier("injuryDescription", forIndexPath: indexPath) as! InjuryDescTableViewCell
            return descCell
        case InjurySections.Prevention.rawValue:
            let prevCell = tableView.dequeueReusableCellWithIdentifier("injuryPrevention", forIndexPath: indexPath) as! InjuryPrevTableViewCell
            return prevCell
        case InjurySections.Severity.rawValue:
            let severityCell = tableView.dequeueReusableCellWithIdentifier("injurySeverity", forIndexPath: indexPath) as! InjurySevTableViewCell
            return severityCell
        case InjurySections.Date.rawValue:
            let dateCell = tableView.dequeueReusableCellWithIdentifier("injuryDate", forIndexPath: indexPath) as! InjuryDateTableViewCell
            return dateCell
        default:
            break
        }
        return UITableViewCell()
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if let tableViewSections = InjurySections(rawValue: section) {
            switch tableViewSections {
            case .Name:
                return InjurySections.Name.description
            case .Description:
                return InjurySections.Description.description
            case .Prevention:
                return InjurySections.Prevention.description
            case .Severity:
                return InjurySections.Severity.description
            case .Date:
                return InjurySections.Name.description
            default:
                break
            }
        }
        return ""
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        //        switch indexPath.section {
        //        case Sections.Input.rawValue:
        //            return 100.0
        //        default:
        //            return 50.0
        //        }
        return 200
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
        return 30.0
    }


}
