//
//  Network.swift
//  DPI
//
//  Created by Bas Broek on 5/26/16.
//  Copyright © 2016 Bas Broek. All rights reserved.
//

import Foundation

private var storedNotifications: [StoredNotification: Bool] = [:]

enum Network {
  
  static func store(notification notification: Notification, `for` user: User, forTopic: Bool = false) {
    debugPrint("[DEBUG] Storing notification \(user)")
    storedNotifications[StoredNotification(notification: notification, user: user)] = forTopic
  }
  
  static func remove(notification notification: Notification, `for` user: User) {
    debugPrint("[DEBUG] Removing notification from network")
    storedNotifications[StoredNotification(notification: notification, user: user)] = nil
  }
  
  static func notifications(`for` user: User) {
    let notifications = storedNotifications
      .filter { key, _ in key.user == user }
    defer { notifications.forEach { Network.remove(notification: $0.0.notification, for: $0.0.user) } }
    notifications.forEach { user.receive(notification: $0.0.notification, forTopic: $0.1) }
  }
}

private struct StoredNotification {
  let notification: Notification
  let user: User
}

extension StoredNotification: Hashable {
  
  var hashValue: Int {
    return notification.hashValue ^ user.hashValue
  }
}

private func ==(lhs: StoredNotification, rhs: StoredNotification) -> Bool {
  return lhs.notification == rhs.notification && lhs.user == rhs.user
}
