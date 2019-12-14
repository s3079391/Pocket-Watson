//
//  AddBookViewModel.swift
//  Pocket Watson
//
//  Created by Dana Forte on 9/12/19.
//  Copyright © 2019 RMIT. All rights reserved.
//

import Foundation
import UIKit

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
    mutating func addBook(_ isbn:String, title:String, author:String, imageURL:String, pageCount:Int, description:String) {
        
        guard let image:UIImage = getImageFor(url: imageURL) else {
            return
        }
        
        libraryManager.addBookToLibrary(isbn, title:title, author:author, coverImage:image, pageCount:pageCount, summary:description)
        
    }
    
    func getImageFor(url:String) -> UIImage? {
        let image:UIImage? = nil
        guard let imageURL = URL(string:url) else {
            return image
        }
        let data = try? Data(contentsOf:imageURL)
        if let imageData = data {
            return UIImage(data:imageData)
        }
        return image
    }


}
