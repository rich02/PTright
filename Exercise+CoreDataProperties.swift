//
//  Exercise+CoreDataProperties.swift
//  PTRight
//
//  Created by Seanmichael Stanley on 11/16/15.
//  Copyright © 2015 James Tapia. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Exercise {

    @NSManaged var name: String?
    @NSManaged var exerciseDesc: String?
    @NSManaged var injury: Injury?
    @NSManaged var videos: NSSet?

}
