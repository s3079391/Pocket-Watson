//
//  BookDetailsViewController.swift
//  Pocket Watson
//
//  Created by Andrew Savva on 11/12/19.
//  Copyright © 2019 RMIT. All rights reserved.
//

import UIKit

class BookDetailsViewController: UIViewController {
    
    private var bookOptionsVM = BookOptionsViewModel()
    var selectedBook:NewBook?
    
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookAuthor: UILabel!
    @IBOutlet weak var bookPageCount: UILabel!
    @IBOutlet weak var bookDescription: UITextView!
    
    @IBOutlet weak var statusIndicator: UILabel!
    @IBOutlet weak var progressIndicator: UILabel!
    @IBOutlet weak var numberOfClues: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let book = selectedBook {
            bookImage.image = bookOptionsVM.getImageFor(book: book)
            bookTitle.text = book.title
            bookAuthor.text = book.author
            bookPageCount.text = "\(book.pageCount)pgs"
            bookDescription.text = book.summary
            
            statusIndicator.text = book.status
            progressIndicator.text = bookOptionsVM.progressIndicator(book: book)
            numberOfClues.text = bookOptionsVM.numberOfClues(book: book)
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
