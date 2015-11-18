//
//  Injury.swift
//  PTRight
//
//  Created by Seanmichael Stanley on 11/16/15.
//  Copyright © 2015 James Tapia. All rights reserved.
//

import Foundation
import CoreData


class Injury: NSManagedObject {
    func stringForDate() -> String {
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
        if let date = date {
            return dateFormatter.stringFromDate(date)
        } else {
            return ""
        }
    }
}
