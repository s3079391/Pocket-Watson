//
//  LibraryManager.swift
//  Pocket Watson
//
//  Created by Andrew Savva on 9/12/19.
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
    private (set) var clueList:[NewClue] = []
    
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
    
    func removeBookFromLibrary(book:NewBook) {
        library.removeAll(where: {$0 == book})
        managedContext.delete(book)
        
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
    
    func addClueToBook(book:NewBook, pageNo:Int, clueDesc:String) {
        
        let clueEntity = NSEntityDescription.entity(forEntityName: "NewClue", in: managedContext)!
        let nsClue = NSManagedObject(entity: clueEntity, insertInto: managedContext) as! NewClue
        
        let pgNo:Int16 = Int16(pageNo)
        nsClue.pageNo = pgNo
        nsClue.clueDesc = clueDesc
        nsClue.book = book
        
        book.addToClueList(nsClue)
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }

    }
    
    func removeClueFromBook(book:NewBook, clue:NewClue) {
        
        book.removeFromClueList(clue)
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }

    }
    
    func saveClueToClueList(book:NewBook, clue:NewClue, pageNo:Int, clueDesc:String) {
        removeClueFromBook(book: book, clue: clue)
        addClueToBook(book: book, pageNo: pageNo, clueDesc: clueDesc)
    }
    
}
