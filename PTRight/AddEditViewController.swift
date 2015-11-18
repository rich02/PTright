//
//  AddEditViewControler.swift
//  PTRight
//
//  Created by Seanmichael Stanley on 11/17/15.
//  Copyright © 2015 James Tapia. All rights reserved.
//

import UIKit
import CoreData

class AddEditViewController: UITableViewController {
    
    @IBOutlet weak var injuryName: UITextField!
    @IBOutlet weak var injuryDescription: UITextView!
    @IBOutlet weak var prevention: UITextView!
    @IBOutlet weak var severity: UISlider!
    @IBOutlet weak var dateOfInjury: UIDatePicker!
    
    var context: NSManagedObjectContext!
    var delegate: InjuryDelegate?
    
    var injuryEntry: Injury! {
        didSet {
            self.configureView()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }
    
    func configureView() {
        
        title = injuryEntry.name
        
        if let textField = injuryName {
            if let value = injuryEntry.name {
                textField.text = value
            }
        }
        
        if let textArea = injuryDescription {
            if let value = injuryEntry.injuryDesc {
                textArea.text = value
            }
        }
        
        if let textArea = prevention {
            if let value = injuryEntry.prevention {
                textArea.text = value
            }
        }
        
        if let slider = severity {
            if let value = injuryEntry.severity {
                slider.value = Float(value)
            }
        }
        
        if let datePicker = dateOfInjury {
            if let value = injuryEntry.date {
                datePicker.date = value
            }
        }
        
    }
    
    func updateInjuryEntry() {
        
        if let entry = injuryEntry {
            entry.date = dateOfInjury.date
            entry.name = injuryName.text
            entry.injuryDesc = injuryDescription.text
            entry.prevention = prevention.text
            entry.severity = Int(severity.value)
        }
    }
    
    
    // MARK: Target Action
    
    
    @IBAction func cancelButtonWasTapped(sender: AnyObject) {
        delegate?.didFinishViewController(self, didSave: false)
    }
    
    @IBAction func saveButtonWasTapped(sender: AnyObject) {
        updateInjuryEntry()
        delegate?.didFinishViewController(self, didSave: true)
    }

}
