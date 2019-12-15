//
//  BookOptionsViewModel.swift
//  Pocket Watson
//
//  Created by Andrew Savva on 10/12/19.
//  Copyright © 2019 RMIT. All rights reserved.
//

import Foundation
import UIKit

struct BookOptionsViewModel {
    
    private var libraryMgr = LibraryManager.shared
    
    var libraryList:[NewBook] {
        return libraryMgr.library
    }
    
    func getImageFor(book:NewBook) -> UIImage {
        let noImage = UIImage(named: "NoImageFound")
        guard let image = UIImage(data:book.image! as Data) else {
            return noImage!
        }
        return image
    }
    
    func progressIndicator(book:NewBook) -> String {
        if book.currentPage == 0 {
            return "Book not started"
        } else if book.currentPage < book.pageCount {
            let percentage:Double = Double(book.currentPage) / Double(book.pageCount)
            let roundpercent:Int = Int(round(percentage * 100))
            return "\(roundpercent)%"
        } else {
            return "Book completed"
        }
    }
    
    func numberOfClues(book:NewBook) -> String {
        var count:Int = 0
        if let clueList = book.clueList {
            count = clueList.count
        }
        return "\(count) clues"
    }
    
    func changeReadingStatus(book:NewBook, status:String) {
        for eachBook in libraryList {
            if eachBook == book {
                book.status = status
            }
        }
    }
    
    func updateCurrentPageNo(book:NewBook, pageNo:String) {
        let newPage:Int = Int(pageNo) ?? 0
        libraryMgr.updatePageNumber(book: book, pageNo: Int16(newPage))
    }
    
    func removeBook(book:NewBook) {
        libraryMgr.removeBookFromLibrary(book: book)
    }
}
