//
//  BookDetailViewController.swift
//  Pocket Watson
//
//  Created by Andrew Savva on 8/12/19.
//  Copyright © 2019 RMIT. All rights reserved.
//

import UIKit

class AddBookViewController: UIViewController {
    
    var selectedBook:Book?
    var bookSearchVM = BookSearchViewModel()
    var addBookVM = AddBookViewModel()
    var libraryVM = LibraryViewModel()
    
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookAuthor: UILabel!
    @IBOutlet weak var bookDescription: UITextView!
    @IBOutlet weak var bookPageCount: UILabel!
    
    
    @IBAction func addBook(_ sender: Any) {
        guard let title = bookTitle.text, let author = bookAuthor.text else {
            return
        }
        
        addBookVM.addBook(title, author)
        for (book) in libraryVM.libraryList {
            print(book.title!)
        }
        
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        if let book = selectedBook {
            bookImage.image = bookSearchVM.getImageFor(book: book)
            bookTitle.text = book.title
            bookAuthor.text = book.author
            bookPageCount.text = "\(book.pageCount)pgs"
            bookDescription.text = book.description
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
