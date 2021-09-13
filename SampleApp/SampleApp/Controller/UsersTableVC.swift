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
        
        configureTableView()
    }
    
    //configure delegate and datasource of tableview
    func configureTableView() {
        userTableView.delegate = self
        userTableView.dataSource = self
    }
}

extension UsersTableVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
