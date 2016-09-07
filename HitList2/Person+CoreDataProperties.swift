//
//  Person+CoreDataProperties.swift
//  HitList2
//
//  Created by Gregory Weiss on 8/26/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Person {

    @NSManaged var name: String?
    @NSManaged var theDate: NSDate?
    @NSManaged var theImage: NSData?

}
