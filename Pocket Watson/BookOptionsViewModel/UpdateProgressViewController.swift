//
//  UpdateProgressViewController.swift
//  Pocket Watson
//
//  Created by Dana Forte on 11/12/19.
//  Copyright © 2019 RMIT. All rights reserved.
//

import UIKit

class UpdateProgressViewController: UIViewController {
    
    private var bookOptionsVM = BookOptionsViewModel()
    var selectedBook:NewBook?
    
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookAuthor: UILabel!
    @IBOutlet weak var statusSelector: UISegmentedControl!
    
    
    @IBAction func bookStatus(_ sender: Any) {
        let getIndex = statusSelector.selectedSegmentIndex
        if let book = selectedBook {
            switch getIndex {
            case 0:
                bookOptionsVM.changeReadingStatus(book:book, status: "Reading")
            case 1:
                bookOptionsVM.changeReadingStatus(book:book, status: "Finished")
            case 2:
                bookOptionsVM.changeReadingStatus(book:book, status: "To Buy")
            default:
                print("no selection")
            }
        }
    }
    
    @IBOutlet weak var pageXofY: UILabel!
    @IBOutlet weak var currentPageNo: UITextField!
    @IBAction func updatePageNumber(_ sender: Any) {
        if let book = selectedBook, let currentPage = currentPageNo.text {
            bookOptionsVM.updateCurrentPageNo(book:book, pageNo:currentPage)
            pageXofY.text = "Page \(book.currentPage) of \(book.pageCount)"
        }
    }
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let book = selectedBook {
            bookTitle.text = book.title
            bookAuthor.text = book.author
            pageXofY.text = "Page \(book.currentPage) of \(book.pageCount)"
            
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
