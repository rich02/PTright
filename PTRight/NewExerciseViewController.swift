//
//  NewExerciseViewController.swift
//  PTRight
//
//  Created by MU IT Program on 11/16/15.
//  Copyright © 2015 James Tapia. All rights reserved.
//

import UIKit

enum ExerciseSections: Int, CustomStringConvertible {
    case Name, Description, Video, Count
    
    var description: String {
        switch (self) {
        case .Name: return "Name"
        case .Description: return "Description"
        case .Video: return "Add Video"
        case .Count: return "Count"
        }
    }
}


class NewExerciseViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var images: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        images = ["ankle_exercise.jpg", "foot_exercise.jpg", "wrist_twist.jpg",]
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return ExerciseSections.Count.rawValue
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let tableViewSections = ExerciseSections(rawValue: section) {
            switch tableViewSections {
            case .Name, .Description, .Video:
                return 1
            default:
                break
            }
        }
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch indexPath.section {
        case ExerciseSections.Name.rawValue:
            let nameCell = tableView.dequeueReusableCellWithIdentifier("exerciseName", forIndexPath: indexPath) as! ExerciseNameTableViewCell
            return nameCell
        case ExerciseSections.Description.rawValue:
            let descCell = tableView.dequeueReusableCellWithIdentifier("exerciseDescription", forIndexPath: indexPath) as! ExerciseDescriptionTableViewCell
            return descCell
        case ExerciseSections.Video.rawValue:
            let videoCell = tableView.dequeueReusableCellWithIdentifier("exerciseVideo", forIndexPath: indexPath) as! ExerciseVideoTableViewCell
            return videoCell
        default:
            break
        }
        return UITableViewCell()
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if let tableViewSections = ExerciseSections(rawValue: section) {
            switch tableViewSections {
            case .Name:
                return ExerciseSections.Name.description
            case .Description:
                return ExerciseSections.Description.description
            case .Video:
                return ExerciseSections.Video.description
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

    

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! ExerciseCollectionViewCell
        cell.imgView.image = UIImage(named: images[indexPath.row])
        
        return cell
        
           }

}
