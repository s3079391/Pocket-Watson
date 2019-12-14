//
//  ClueListTableViewController.swift
//  Pocket Watson
//
//  Created by Andrew Savva on 14/12/19.
//  Copyright © 2019 RMIT. All rights reserved.
//

import UIKit

class ClueListViewController: UITableViewController {
    
    var selectedBook:NewBook?
    private var clueListVM = ClueListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        if let book = selectedBook {
            clueListVM.addNewClue(book: book, pgNo: 13, clue: "Test test")
        }
        
    }
    
    // MARK: - Table view data source

    /*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
    */

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        var count = 0
        if let book = selectedBook {
            count = clueListVM.clueCount(book:book)
        }
        return count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellClue", for: indexPath)

        let pageNo = cell.viewWithTag(3001) as! UILabel
        let clueDesc = cell.viewWithTag(3002) as! UILabel
        
        if let book = selectedBook {
            let clues = clueListVM.getClueList(book: book)
            let clue = clues[indexPath.row]
            pageNo.text = "p\(clue.pageNo)"
            clueDesc.text = clue.clueDesc
        }

        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        guard let selectedRow = self.tableView.indexPathForSelectedRow else {
            return
        }
        
        if let book = selectedBook {
            let destination = segue.destination as? ClueDetailViewController
            let selectedClue = clueListVM.getClue(book: book, index: selectedRow.row)
            destination?.selectedBook = book
            destination?.selectedClue = selectedClue
        }

    }
    
}
