//
//  LibraryViewModel.swift
//  Pocket Watson
//
//  Created by Andrew Savva on 10/12/19.
//  Copyright © 2019 RMIT. All rights reserved.
//

import Foundation
import UIKit

struct LibraryViewModel {
    
    private var libraryMgr = LibraryManager.shared
    
    var libraryList:[NewBook] {
        return libraryMgr.library
    }
    
    var count:Int {
        return libraryList.count
    }
    
    func getBook(index:Int) -> NewBook {
        // print(libraryList[index].title)
        return libraryList[index]
    }
    
    func getImageFor(book:NewBook) -> UIImage {
        let noImage = UIImage(named: "NoImageFound")
        guard let image = UIImage(data:book.image! as Data) else {
            return noImage!
        }
        return image
    }
    
}
