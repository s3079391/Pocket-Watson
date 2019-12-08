//
//  BookSearchViewModel.swift
//  Pocket Watson
//
//  Created by Andrew Savva on 8/12/19.
//  Copyright © 2019 RMIT. All rights reserved.
//

import Foundation
import UIKit

struct BookSearchViewModel {
    
    private var model = REST_Request.shared
    
    var count:Int {
        return bookList.count
    }
    
    var bookList:[Book] {
        return model.bookList
    }
    
    func getTitleFor(index:Int) -> String {
        return bookList[index].title
    }
    
    func getURLFor(index:Int) -> String {
        return bookList[index].url
    }
    
    func getAuthorFor(index:Int) -> String {
        return bookList[index].author
    }
    
    func getDescriptionFor(index:Int) -> String {
        return bookList[index].description
    }
    
    func getPageCountFor(index:Int) -> Int {
        return bookList[index].pageCount
    }

    func getImageFor(index:Int) -> UIImage? {
        let url = bookList[index].imageURL
        let image = UIImage(named:url)
        return image
    }

    func getBook(with title:String, author:String) {
        model.getBook(title: title, author: author)
    }

    
}
