//
//  LibraryManager.swift
//  Pocket Watson
//
//  Created by Dana Forte on 9/12/19.
//  Copyright © 2019 RMIT. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class LibraryManager {
    
    static let shared = LibraryManager()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    let managedContext:NSManagedObjectContext
    
    private (set) var library:[NewBook] = []
    
    private init() {
        managedContext = appDelegate.persistentContainer.viewContext
        loadLibrary()
    }
    
    private func createNSBook(_ isbn:String, title:String, author:String, coverImage:UIImage, pageCount:Int, summary:String) -> NewBook {
        
        let bookEntity = NSEntityDescription.entity(forEntityName: "NewBook", in: managedContext)!
        
        let nsBook = NSManagedObject(entity: bookEntity, insertInto: managedContext) as! NewBook
        
        
        nsBook.isbn = isbn
        nsBook.title = title
        nsBook.author = author
        nsBook.pageCount = Int16(pageCount)
        nsBook.summary = summary

        let imageData = coverImage.pngData() as Data?
        nsBook.image = imageData
        
        nsBook.currentPage = 0
        nsBook.status = "Reading"

        return nsBook
    }

    func addBookToLibrary(_ isbn:String, title:String, author:String, coverImage:UIImage, pageCount:Int, summary:String) {
        
        let nsBook = createNSBook(isbn, title:title, author:author, coverImage:coverImage, pageCount:pageCount, summary:summary)
        library.append(nsBook)
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
        
    }
    
    private func loadLibrary() {
        do {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "NewBook")
            let result = try managedContext.fetch(fetchRequest)
            library = result as! [NewBook]
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
}
