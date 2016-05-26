//
//  Printer.swift
//  DPI
//
//  Created by Bas Broek on 5/26/16.
//  Copyright © 2016 Bas Broek. All rights reserved.
//

import Foundation

struct Printer {
  
}

extension Printer {
  
  func send(notification notification: Notification, to users: User...) {
    onBackgroundQueue {
      users
        .filter { $0.online }
        .forEach { $0.receive(notification: notification) }
      
      allUsers
        .filter { !users.contains($0) }
        .filter { $0.online }
        .filter { $0.subscriptions.contains(notification.topic) || $0.subscriptions.contains(.all) }
        .forEach { $0.receive(notification: notification, forTopic: true) }
      
      users
        .filter { !$0.online }
        .forEach { Network.store(notification: notification, for: $0) }
      
      allUsers
        .filter { !users.contains($0) }
        .filter { !$0.online }
        .filter { $0.subscriptions.contains(notification.topic) || $0.subscriptions.contains(.all) }
        .forEach { Network.store(notification: notification, for: $0, forTopic: true) }
    }
  }
}
