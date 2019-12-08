//
//  REST_Request.swift
//  Pocket Watson
//
//  Created by Dana Forte on 8/12/19.
//  Copyright © 2019 RMIT. All rights reserved.
//

import Foundation

struct REST_Request {
    
    private var books:[Book] = []
    
    private let session = URLSession.shared
    
    private let base_url:String = "https://www.googleapis.com/books/v1/volumes?q="
    private let paramTitle:String = "intitle:"
    private let paramAuthor:String = "+inauthor:"

    mutating func getBook(title:String, author:String) {
        books = []
        let url = base_url + paramTitle + title + paramAuthor + author
        print(url)
        
        guard let escapedAddress = url.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) else {
            return
        }
        print(escapedAddress)
        
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
                 print(result)
                
                let allBooks = result["items"] as! [[String:Any]]
                print(allBooks)
                
            }
            
        })
        task.resume()
    }

}
