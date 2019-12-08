//
//  BookDetailViewController.swift
//  Pocket Watson
//
//  Created by Andrew Savva on 8/12/19.
//  Copyright © 2019 RMIT. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {
    
    var selectedBook:Book?
    var viewModel = BookSearchViewModel()
    
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookAuthor: UILabel!
    @IBOutlet weak var bookDescription: UITextView!
    @IBOutlet weak var bookPageCount: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        if let book = selectedBook {
            bookImage.image = viewModel.getImageFor(book: book)
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
