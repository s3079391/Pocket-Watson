//
//  BookDetailsViewController.swift
//  Pocket Watson
//
//  Created by Dana Forte on 11/12/19.
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
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let book = selectedBook {
            bookTitle.text = book.title
            bookAuthor.text = book.author
            bookPageCount.text = "\(book.pageCount)pgs"
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
