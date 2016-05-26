//
//  TableViewController.swift
//  DPI
//
//  Created by Bas Broek on 5/26/16.
//  Copyright © 2016 Bas Broek. All rights reserved.
//

import UIKit

var user1: User!
var user2: User!
var user3: User!

class TableViewController: UITableViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    user1 = User(id: 1, name: "Bas", online: false)
    user1.subscribe(to: .error)
    
    user2 = User(id: 2, name: "Tom")
    user2.subscribe(to: .warning)
    
    user3 = User(id: 3, name: "Casper")
    user3.subscribe(to: .all)
  }
}

// MARK: - Table view data source
extension TableViewController {
  
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }

  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return allUsers.count
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("user", forIndexPath: indexPath) as! TableViewCell
    cell.user = allUsers[indexPath.row]
    
    return cell
  }
}
