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

    @NSManaged public var isbn: String?
    @NSManaged public var title: String?
    @NSManaged public var url: String?
    @NSManaged public var author: String?
    @NSManaged public var image: Data?
    @NSManaged public var currentPage: Int16
    @NSManaged public var pageCount: Int16
    @NSManaged public var summary: String?
    @NSManaged public var status: String?
    
}
