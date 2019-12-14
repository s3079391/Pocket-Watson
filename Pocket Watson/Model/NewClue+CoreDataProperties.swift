//
//  NewClue+CoreDataProperties.swift
//  Pocket Watson
//
//  Created by Dana Forte on 14/12/19.
//  Copyright © 2019 RMIT. All rights reserved.
//
//

import Foundation
import CoreData


extension NewClue {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NewClue> {
        return NSFetchRequest<NewClue>(entityName: "NewClue")
    }

    @NSManaged public var pageNo: Int16
    @NSManaged public var clueDesc: String?
    @NSManaged public var book: NewBook?

}
