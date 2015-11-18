//
//  MyInjuriesTableViewController.swift
//  PTRight
//
//  Created by MU IT Program on 11/16/15.
//  Copyright © 2015 James Tapia. All rights reserved.
//

import UIKit
import CoreData

class MyInjuriesTableViewController: UITableViewController, NSFetchedResultsControllerDelegate {

    var coreDataStack: CoreDataStack!
    lazy var fetchedResultController: NSFetchedResultsController = self.injuryFetchedResultsController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    func injuryFetchedResultsController() -> NSFetchedResultsController {
       
        fetchedResultController = NSFetchedResultsController(fetchRequest: injuryFetchRequest(), managedObjectContext: coreDataStack.context, sectionNameKeyPath: nil, cacheName: nil)
        fetchedResultController.delegate = self
        
        do {
            try fetchedResultController.performFetch()
        } catch let error as NSError {
            print("Error: \(error.localizedDescription)")
            abort()
        }
        
        return fetchedResultController
    }
    
    
    func injuryFetchRequest() -> NSFetchRequest {
        
        let fetchRequest = NSFetchRequest(entityName: "Injury")
        let sortDescriptor = NSSortDescriptor(key: "date", ascending: false)
        fetchRequest.sortDescriptors = [sortDescriptor]
        return fetchRequest
    }
    
    
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        tableView.reloadData()
    }
    
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return fetchedResultController.sections!.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let sectionInfo = fetchedResultController.sections![section]
        return sectionInfo.numberOfObjects
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCellWithIdentifier("injuryCellReuseIdentifier", forIndexPath: indexPath) as! InjuryCell
        configureCell(cell, indexPath: indexPath)
        return cell
    }
    
    func configureCell(cell: InjuryCell, indexPath: NSIndexPath) {
            
            let injury = fetchedResultController.objectAtIndexPath(indexPath) as! Injury
            
            cell.injuryDate.text = injury.stringForDate()
        
            cell.injuryName.text = injury.name
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
            
            if editingStyle == .Delete {
                let alert = UIAlertController(title: "Alert", message: "This will permanently delete the information under this injury!", preferredStyle: .Alert)
                
                let deleteAction = UIAlertAction(title: "Delete", style: .Default) { (action) -> Void in
                    let injury = self.fetchedResultController.objectAtIndexPath(indexPath)
                        as! Injury
                    self.coreDataStack.context.deleteObject(injury)
                    self.coreDataStack.saveContext()
                }
                
                let cancelAction = UIAlertAction(title: "Cancel", style: .Default) { (action) -> Void in
                  self.coreDataStack.saveContext()
                }
                
                alert.addAction(deleteAction)
                alert.addAction(cancelAction)
                
                self.presentViewController(alert, animated: true, completion: nil)
            }
    }
    
   override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
        if segue.identifier == "showInjury" {
            
            let indexPath = tableView.indexPathForSelectedRow
            let injury = fetchedResultController.objectAtIndexPath(indexPath!) as! Injury
            
            let detailViewController = segue.destinationViewController as! TreatmentViewController
            
            detailViewController.injury = injury
            
                
                
                
                
                
              /*  //4
                detailViewController.journalEntry = surfJournalEntry
                detailViewController.context
                    = surfJournalEntry.managedObjectContext
                detailViewController.delegate = self
                
            } else if segue.identifier == "SegueListToDetailAdd" {
                
                let navigationController =
                segue.destinationViewController as!
                UINavigationController
                let detailViewController =
                navigationController.topViewController as!
                JournalEntryViewController
                
                
                let journalEntryEntity =
                NSEntityDescription.entityForName("JournalEntry",
                    inManagedObjectContext: coreDataStack.context)
                let newJournalEntry =
                JournalEntry(entity: journalEntryEntity!,
                    insertIntoManagedObjectContext:
                    coreDataStack.context)
                
                detailViewController.journalEntry = newJournalEntry
                detailViewController.context
                    = newJournalEntry.managedObjectContext
                detailViewController.delegate = self*/
            
    }


    
}

