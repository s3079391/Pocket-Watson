//
//  ViewController.swift
//  Pocket Watson
//
//  Created by Andrew Savva on 8/12/19.
//  Copyright © 2019 RMIT. All rights reserved.
//

import UIKit

class BookSearchViewController: UIViewController, UITableViewDataSource {
    
    var viewModel = BookSearchViewModel()
    
    @IBOutlet weak var bookTitle: UITextField!
    @IBOutlet weak var bookAuthor: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func search(_ sender: Any) {
        viewModel.getBook(with: bookTitle.text!, author: bookAuthor.text!)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellBook", for: indexPath)
        
        let title = cell.viewWithTag(1001) as! UILabel
        let author = cell.viewWithTag(1002) as! UILabel
        let imageView = cell.viewWithTag(1000) as! UIImageView
        
        title.text = viewModel.getTitleFor(index: indexPath.row)
        author.text = viewModel.getAuthorFor(index:indexPath.row)
        imageView.image = viewModel.getImageFor(index: indexPath.row)
        
        return cell
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }


}

