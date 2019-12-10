//
//  LibraryViewModel.swift
//  Pocket Watson
//
//  Created by Dana Forte on 10/12/19.
//  Copyright © 2019 RMIT. All rights reserved.
//

import Foundation

struct LibraryViewModel {
    
    private var libraryMgr = LibraryManager.shared
    
    var libraryList:[NewBook] {
        return libraryMgr.library
    }
    
    var count:Int {
        return libraryList.count
    }
    
    func getBook(index:Int) -> NewBook {
        return libraryList[index]
    }
    
}
