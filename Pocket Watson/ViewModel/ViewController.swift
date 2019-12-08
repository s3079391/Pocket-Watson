//
//  ViewController.swift
//  Pocket Watson
//
//  Created by Dana Forte on 8/12/19.
//  Copyright © 2019 RMIT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        var request = REST_Request()
        request.getBook(title: "Deaths", author: "Stuart Turton")
    }


}

