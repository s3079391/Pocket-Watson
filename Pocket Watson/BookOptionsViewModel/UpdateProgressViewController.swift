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
    
    @IBAction func bookStatus(_ sender: Any) {
    }
    
    @IBOutlet weak var pageXofY: UILabel!
    
    @IBOutlet weak var currentPageNo: UITextField!
    @IBAction func updatePageNumber(_ sender: Any) {
    }
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let book = selectedBook {
            bookTitle.text = book.title
            bookAuthor.text = book.author
            pageXofY.text = "Page X of \(book.pageCount)"
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
