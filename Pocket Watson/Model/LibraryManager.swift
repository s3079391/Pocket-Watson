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
    
    private func createNSBook(_ title:String, author:String, url:String, imageURL:String, pageCount:Int, desc:String) -> NewBook {
        
        let bookEntity = NSEntityDescription.entity(forEntityName: "NewBook", in: managedContext)!
        
        let nsBook = NSManagedObject(entity: bookEntity, insertInto: managedContext) as! NewBook
        
        nsBook.setValue(title, forKey: "title")
        nsBook.setValue(author, forKey: "author")
        nsBook.setValue(url, forKey: "url")
        nsBook.setValue(imageURL, forKey: "imageURL")
        nsBook.setValue(desc, forKey: "bookDescription")

        return nsBook
    }

    func addBookToLibrary(_ title:String, author:String, url:String, imageURL:String, pageCount:Int, desc:String) {
        
        let nsBook = createNSBook(title, author: author, url: url, imageURL: imageURL, pageCount: pageCount, desc: desc)
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
