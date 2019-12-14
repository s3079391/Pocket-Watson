//
//  ClueListTableViewController.swift
//  Pocket Watson
//
//  Created by Dana Forte on 14/12/19.
//  Copyright © 2019 RMIT. All rights reserved.
//

import UIKit

class ClueListViewController: UITableViewController {
    
    var selectedBook:NewBook?
    private var clueListVM = ClueListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        if let book = selectedBook {
            clueListVM.addNewClue(book: book, pgNo: 42, clue: "Test")
            clueListVM.addNewClue(book: book, pgNo: 13, clue: "Test test")
            clueListVM.addNewClue(book: book, pgNo: 23, clue: "Test test test")
            clueListVM.addNewClue(book: book, pgNo: 17, clue: "Test test test test")
        }
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

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
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
