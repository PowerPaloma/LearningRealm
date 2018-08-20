//
//  UsersTableViewController.swift
//  LearningRealm
//
//  Created by Ada 2018 on 14/08/2018.
//  Copyright © 2018 Academy. All rights reserved.
//

import UIKit
import RealmSwift

class UsersTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet var tableView: UITableView!
    var users: Results<User>!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DBManager.sharedInstance.deleteAllFromDatabase()
        tableView.delegate = self
        tableView.dataSource = self
        users = DBManager.sharedInstance.getDataOfEntity(entity: User.self)
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        users = DBManager.sharedInstance.getDataOfEntity(entity: User.self)
        tableView.reloadData()
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.nameContact.text = users[indexPath.row].name
        //cell.imageContact.image =
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        var resultQuery: Results<User>
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            repeat {
                var txtFieldPass = ""
                let alert = UIAlertController(title: "Confirm Password", message: "Please, confirm your password to delete this contact", preferredStyle: .alert)
                alert.addTextField { (pass) in
                    pass.text = "password"
                }
                alert.addAction(UIAlertAction(title: "Delete Contact", style: .default, handler: { (confirm) in
                    let pass = alert.textFields![0] as UITextField
                    txtFieldPass = pass.text!
                }))
                let nameUser = users[indexPath.row].name
                let predicate = NSPredicate(format: "name = %@ AND senha = %@", nameUser , txtFieldPass)
                resultQuery = DBManager.sharedInstance.query(query: predicate)
            } while (resultQuery.isEmpty)
            
        }
    }
    

}

