//
//  Clue+CoreDataProperties.swift
//  Pocket Watson
//
//  Created by Dana Forte on 14/12/19.
//  Copyright © 2019 RMIT. All rights reserved.
//
//

import Foundation
import CoreData


extension Clue {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Clue> {
        return NSFetchRequest<Clue>(entityName: "Clue")
    }

    @NSManaged public var pageNo: Int16
    @NSManaged public var clueDesc: String?

}
