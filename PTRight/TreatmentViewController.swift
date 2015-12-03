//
//  TreatmentViewController.swift
//  PTRight
//
//  Created by MU IT Program on 12/2/15.
//  Copyright © 2015 James Tapia. All rights reserved.
//

import UIKit

enum TreatmentSections: Int, CustomStringConvertible {
    case Name, Date, Severity, Description, Prevention, Exercises, Count
    
    var description: String {
        switch (self) {
        case .Name: return "Name"
        case .Date: return "Date"
        case .Severity: return "Severity"
        case .Description: return "Description"
        case .Prevention: return "Prevention"
        case .Exercises: return "All Exercises"
        case .Count: return "Count"
        }
    }
}


class TreatmentViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return TreatmentSections.Count.rawValue
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let tableViewSections = TreatmentSections(rawValue: section) {
            switch tableViewSections {
            case .Name, .Date, .Severity, .Description, .Prevention, .Exercises:
                return 1
            default:
                break
            }
        }
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch indexPath.section {
        case TreatmentSections.Name.rawValue:
            let nameCell = tableView.dequeueReusableCellWithIdentifier("treatmentName", forIndexPath: indexPath) as! TreatmentNameTableViewCell
            return nameCell
        case TreatmentSections.Date.rawValue:
            let dateCell = tableView.dequeueReusableCellWithIdentifier("treatmentDate", forIndexPath: indexPath) as! TreatmentDateTableViewCell
            return dateCell
        case TreatmentSections.Severity.rawValue:
            let sevCell = tableView.dequeueReusableCellWithIdentifier("treatmentSeverity", forIndexPath: indexPath) as! TreatmentSeverityTableViewCell
            return sevCell
        case TreatmentSections.Description.rawValue:
            let descCell = tableView.dequeueReusableCellWithIdentifier("treatmentDescription", forIndexPath: indexPath) as! TreatmentDescriptionTableViewCell
            return descCell
        case TreatmentSections.Prevention.rawValue:
            let prevCell = tableView.dequeueReusableCellWithIdentifier("treatmentPrevention", forIndexPath: indexPath) as! TreatmentPreventionTableViewCell
            return prevCell
        case TreatmentSections.Exercises.rawValue:
            let exerciseCell = tableView.dequeueReusableCellWithIdentifier("treatmentExercises", forIndexPath: indexPath) as! TreatmentExerciseTableViewCell
            return exerciseCell
        default:
            break
        }
        return UITableViewCell()
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if let tableViewSections = TreatmentSections(rawValue: section) {
            switch tableViewSections {
            case .Name:
                return TreatmentSections.Name.description
            case .Date:
                return TreatmentSections.Date.description
            case .Severity:
                return TreatmentSections.Severity.description
            case .Description:
                return TreatmentSections.Description.description
            case .Prevention:
                return TreatmentSections.Prevention.description
            case .Exercises:
                return TreatmentSections.Exercises.description
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
        return 100
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
        return 30.0
    }

    

    /*func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell! = tableView.dequeueReusableCellWithIdentifier("treatmentExercises")
        
        cell.textLabel?.text = "Wrist Curl"
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.reloadData()
    }*/

}
