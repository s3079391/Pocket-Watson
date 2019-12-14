//
//  NewBook+CoreDataProperties.swift
//  Pocket Watson
//
//  Created by Andrew Savva on 14/12/19.
//  Copyright © 2019 RMIT. All rights reserved.
//
//

import Foundation
import CoreData


extension NewBook {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NewBook> {
        return NSFetchRequest<NewBook>(entityName: "NewBook")
    }

    @NSManaged public var author: String?
    @NSManaged public var currentPage: Int16
    @NSManaged public var image: Data?
    @NSManaged public var isbn: String?
    @NSManaged public var pageCount: Int16
    @NSManaged public var status: String?
    @NSManaged public var summary: String?
    @NSManaged public var title: String?
    @NSManaged public var url: String?
    @NSManaged public var clueList: NSSet?

}

// MARK: Generated accessors for clueList
extension NewBook {

    @objc(addClueListObject:)
    @NSManaged public func addToClueList(_ value: NewClue)

    @objc(removeClueListObject:)
    @NSManaged public func removeFromClueList(_ value: NewClue)

    @objc(addClueList:)
    @NSManaged public func addToClueList(_ values: NSSet)

    @objc(removeClueList:)
    @NSManaged public func removeFromClueList(_ values: NSSet)

}
