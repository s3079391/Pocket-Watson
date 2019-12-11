//
//  ViewController.swift
//  Pocket Watson
//
//  Created by Andrew Savva on 8/12/19.
//  Copyright © 2019 RMIT. All rights reserved.
//

import UIKit

class BookSearchViewController: UIViewController, UITableViewDataSource, Refresh {
    
    var bookSearchVM = BookSearchViewModel()
    
    @IBOutlet weak var bookTitle: UITextField!
    @IBOutlet weak var bookAuthor: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func search(_ sender: Any) {
        bookSearchVM.getBook(with: bookTitle.text!, author: bookAuthor.text!)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        bookSearchVM.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellBook", for: indexPath)
        
        let title = cell.viewWithTag(1001) as! UILabel
        let author = cell.viewWithTag(1002) as! UILabel
        let imageView = cell.viewWithTag(1000) as! UIImageView
        
        title.text = bookSearchVM.getTitleFor(index: indexPath.row)
        author.text = bookSearchVM.getAuthorFor(index:indexPath.row)
        imageView.image = bookSearchVM.getImageFor(index: indexPath.row)
        
        return cell
    }

    func updateUI() {
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        bookSearchVM.delegate = self
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        guard let selectedRow = self.tableView.indexPathForSelectedRow else {
            return
        }
        let destination = segue.destination as? AddBookViewController
        
        // Pass the selected object to the new view controller.
        let selectedBook = bookSearchVM.bookDetails(byIndex: selectedRow.row)
        destination?.selectedBook = selectedBook
    }

}

