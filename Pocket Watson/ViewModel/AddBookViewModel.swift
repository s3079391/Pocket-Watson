//
//  AddBookViewModel.swift
//  Pocket Watson
//
//  Created by Dana Forte on 9/12/19.
//  Copyright © 2019 RMIT. All rights reserved.
//

import Foundation

struct AddBookViewModel {

private var libraryManager = LibraryManager.shared

var bookTitles:String {
    var result:String = ""
    let books = libraryManager.library
    for(_, book) in books.enumerated() {
        if let title = book.title {
            result += title + "\n"
        }
    }
    return result
}
    mutating func addBook(_ title:String, _ author:String) {
        
        libraryManager.addBookToLibrary(title, author: author)
        
    }
    
}
