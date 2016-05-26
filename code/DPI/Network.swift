//
//  Network.swift
//  DPI
//
//  Created by Bas Broek on 5/26/16.
//  Copyright © 2016 Bas Broek. All rights reserved.
//

import Foundation

private var storedNotifications: [Notification: (user: User, forTopic: Bool)] = [:]

enum Network {
  
  static func store(notification notification: Notification, `for` user: User, forTopic: Bool = false) {
    debugPrint("[DEBUG] Storing notification")
    storedNotifications[notification] = (user, forTopic)
  }
  
  static func remove(notification notification: Notification) {
    debugPrint("[DEBUG] Removing notification from network")
    storedNotifications[notification] = nil
  }
  
  static func notifications(`for` user: User) {
    let notifications = storedNotifications
      .filter { _, value in value.user == user }
    defer { notifications.forEach { Network.remove(notification: $0.0) } }
    notifications.forEach { user.receive(notification: $0.0, forTopic: $0.1.forTopic) }
  }
}
