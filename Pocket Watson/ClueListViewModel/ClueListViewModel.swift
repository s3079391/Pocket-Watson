//
//  ClueList.swift
//  Pocket Watson
//
//  Created by Dana Forte on 14/12/19.
//  Copyright © 2019 RMIT. All rights reserved.
//

import Foundation

struct ClueListViewModel {
    
    private var libraryMgr = LibraryManager.shared
    
    func clueCount(book:NewBook) -> Int {
        if let count = book.clueList?.count {
            return count
        } else {
            return 0
        }
    }

    func getClueList(book:NewBook) -> [NewClue] {
        let clues:[NewClue] = book.clueList?.allObjects as! [NewClue]
        let sortedClues = clues.sorted(by: {$0.pageNo < $1.pageNo})
        return sortedClues
    }

//    func getClue(book:NewBook, index:Int) -> NewClue {
//        let clues:[NewClue] = book.clueList?.allObjects as! [NewClue]
//        clues.sorted(by: {$0.pageNo > $1.pageNo})
//
//        return clues[index]
//    }
    
    func addNewClue(book:NewBook, pgNo:Int, clue:String) {
        libraryMgr.addClue(book: book, pageNo: pgNo, clueDesc: clue)
    }
    
}
