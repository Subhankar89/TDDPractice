//
//  ViewController.swift
//  SampleApp
//
//  Created by Subhankar  Acharya on 10/09/21.
//

import UIKit

class UsersTableVC: UIViewController {

    @IBOutlet weak var userTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Users"
    }
}

