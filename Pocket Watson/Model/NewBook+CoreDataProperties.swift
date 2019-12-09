//
//  NewBook+CoreDataProperties.swift
//  Pocket Watson
//
//  Created by Dana Forte on 9/12/19.
//  Copyright © 2019 RMIT. All rights reserved.
//
//

import Foundation
import CoreData


extension NewBook {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NewBook> {
        return NSFetchRequest<NewBook>(entityName: "NewBook")
    }

    @NSManaged public var title: String?
    @NSManaged public var url: String?
    @NSManaged public var author: String?
    @NSManaged public var imageURL: String?
    @NSManaged public var pageCount: Int16
    @NSManaged public var bookDescription: String?

}
