//
//  AddClueViewController.swift
//  Pocket Watson
//
//  Created by Andrew Savva on 14/12/19.
//  Copyright © 2019 RMIT. All rights reserved.
//

import UIKit

class ClueDetailViewController: UIViewController {
    
    private var clueListVM = ClueListViewModel()
    var selectedBook:NewBook?
    var selectedClue:NewClue?
    
    
    @IBOutlet weak var cluePageNo: UITextField!
    @IBOutlet weak var clueDescription: UITextView!
    
    @IBAction func cancelClue(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveClue(_ sender: Any) {
        guard let newCluePage = cluePageNo.text,
            let newClueDesc = clueDescription.text
            else {
                return
        }
        
        if let book = selectedBook,
            let clue = selectedClue {
            clueListVM.saveClue(book: book, clue: clue, newPage: newCluePage, newDesc: newClueDesc)
            dismiss(animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let clue = selectedClue {
            cluePageNo.text = String(clue.pageNo)
            clueDescription.text = clue.clueDesc
        }
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? ClueListViewController
        destination?.tableView.reloadData()
    }
    

}
