//
//  REST_Request.swift
//  Pocket Watson
//
//  Created by Andrew Savva on 8/12/19.
//  Copyright © 2019 RMIT. All rights reserved.
//

import Foundation

protocol Refresh {
    func updateUI()
}

class REST_Request {
    
    private var books:[Book] = []
    
    var delegate:Refresh?
    private let session = URLSession.shared
    
    private let base_url:String = "https://www.googleapis.com/books/v1/volumes?q="
    
    var bookList:[Book] {
        return books
    }

    func getBook(title:String, author:String) {
        books = []
        
        var titleSearch:String = ""
        var authorSearch:String = ""
        if title != "" {
            titleSearch = "intitle:" + title
        }
        if author != "" {
            authorSearch = "+inauthor:" + author
        }
        
        let url:String = base_url + titleSearch + authorSearch
//        print(url)
        
        guard let escapedAddress = url.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) else {
            return
        }
//        print(escapedAddress)
        
        if let url = URL(string:escapedAddress) {
            let request = URLRequest(url:url)
            getData(request, element: "items")
        }
        
    }
    
    private func getData(_ request:URLRequest, element:String) {
        let task = session.dataTask(with: request, completionHandler: {data, response, downloadError in
            
            if let error = downloadError {
                print(error)
            } else {
                var parsedResult:Any! = nil
                // I must understand JSON response for below
                do {
                    parsedResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
                } catch {
                    print()
                }
                let result = parsedResult as! [String:Any]
                // for debugging
                // print(result)
                
                let allBooks = result["items"] as! [[String:Any]]
                // print(allBooks)
                
                if allBooks.count > 0 {
                    for eachBook in allBooks {
                        let volInfo = eachBook["volumeInfo"] as! [String:Any]

                        let title = volInfo["title"] as! String
                        let url = volInfo["canonicalVolumeLink"] as! String
                        
                        var author = ""
                        if let authorArray = volInfo["authors"] {
                            let authorName = authorArray as! [String]
                            author = authorName[0]
                        }
                        
                        var imageName = ""
                        if let img = volInfo["imageLinks"] {
                            let imageInfo = img as! [String:Any]
                            imageName = imageInfo["smallThumbnail"] as! String
                        }

                        var description = ""
                        if let desc = volInfo["description"] {
                            description = desc as! String
                        }
                        
                        var pageCount = 0
                        if let pg = volInfo["pageCount"] {
                            pageCount = pg as! NSInteger
                        }
                        
                        let book = Book(title: title, url: url, author: author, imageURL: imageName, description: description, pageCount: pageCount)
                        self.books.append(book)
                    }
                }
                // print(self.books)
                // cannot update from background thread
                DispatchQueue.main.async {
                    self.delegate?.updateUI()
                }
            }
            
        })
        task.resume()
    }

    private init() {}
    static let shared = REST_Request()
    
}
