//
//  User.swift
//  DPI
//
//  Created by Bas Broek on 5/26/16.
//  Copyright © 2016 Bas Broek. All rights reserved.
//

import Foundation

public struct User {
  let id: Int
  let name: String
  var online = true {
    didSet {
      allUsers.remove(self)
      print("\(name) is now \(online ? "online" : "offline")")
      allUsers.append(self)
      fetch()
    }
  }
  var subscriptions: [Topic] = []
  
  init(id: Int, name: String, online: Bool = true, subscriptions: [Topic] = []) {
    self.id = id
    self.name = name
    self.online = online
    self.subscriptions = subscriptions
    
    allUsers.append(self)
  }
}

extension User {
  
  mutating func subscribe(to topics: Topic...) {
    let newTopics = topics.filter { !subscriptions.contains($0) }
    
    allUsers.remove(self)
    subscriptions.appendContentsOf(newTopics)
    allUsers.append(self)
  }
  
  func receive(notification notification: Notification, forTopic topic: Bool = false) {
    onMainQueue {
      print("\(topic ? "[TOPIC] " : "")\(self.name) received a notification:")
      print("\(notification)")
      print("")
    }
  }
}

private extension User {
  
  func fetch() {
    Network.notifications(for: self)
  }
}

extension User: Hashable {
  
  public var hashValue: Int {
    return self.id.hashValue ^ self.name.hashValue
  }
}

public func ==(lhs: User, rhs: User) -> Bool {
  return lhs.id == rhs.id
}
