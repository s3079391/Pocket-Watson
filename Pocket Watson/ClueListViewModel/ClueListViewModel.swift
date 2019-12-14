//
//  ClueList.swift
//  Pocket Watson
//
//  Created by Andrew Savva on 14/12/19.
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

    func getClue(book:NewBook, index:Int) -> NewClue {
        let clueList = getClueList(book: book)
        return clueList[index]
    }
    
    func addNewClue(book:NewBook, pgNo:Int, clue:String) {
        libraryMgr.addClueToBook(book: book, pageNo: pgNo, clueDesc: clue)
    }
    
//    func saveClue(book:NewBook, clue:NewClue, clueID:Int) {
//        let clueList = getClueList(book: book)
//        let selectedClue = clueList[clueID]
//        selectedClue.pageNo = clue.pageNo
//        selectedClue.clueDesc = clue.clueDesc
//    }
    
    func saveClue(book:NewBook, clue:NewClue, newPage:String, newDesc:String) {
        guard let newPgNo = Int(newPage) else {
            return
        }
        libraryMgr.addClueToBook(book: book, pageNo: newPgNo, clueDesc: newDesc)
    }
}
