//
//  TableViewCell.swift
//  DPI
//
//  Created by Bas Broek on 5/26/16.
//  Copyright © 2016 Bas Broek. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
  @IBOutlet weak var userLabel: UILabel!
  @IBOutlet weak var userOnline: UISwitch!
  var user: User! {
    didSet {
      configure()
    }
  }
}

extension TableViewCell {
  
  @IBAction func userOnlineChanged(sender: UISwitch) {
    user.online = sender.on
  }
}

private extension TableViewCell {
  
  func configure() {
    userLabel.text = user.name
    userOnline.on = user.online
  }
}
