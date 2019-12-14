//
//  BookOptionsViewController.swift
//  Pocket Watson
//
//  Created by Dana Forte on 10/12/19.
//  Copyright © 2019 RMIT. All rights reserved.
//

import UIKit

class BookOptionsViewController: UIViewController {
    
    private var bookOptionsVM = BookOptionsViewModel()
    var selectedBook:NewBook?
    
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookAuthor: UILabel!
    @IBOutlet weak var bookPageCount: UILabel!
    
    
    @IBAction func bookInfo(_ sender: Any) {
    }
    
    @IBAction func bookProgress(_ sender: Any) {
    }
    
    @IBAction func myClues(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let book = selectedBook {
            bookImage.image = bookOptionsVM.getImageFor(book: book)
            bookTitle.text = book.title
            bookAuthor.text = book.author
            bookPageCount.text = "\(book.pageCount)pgs"
        }
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if let destination = segue.destination as? BookDetailsViewController {
            destination.selectedBook = selectedBook
        }
        if let destination = segue.destination as? UpdateProgressViewController {
            destination.selectedBook = selectedBook
        }
    }
    

}
