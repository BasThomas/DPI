//
//  Notification.swift
//  DPI
//
//  Created by Bas Broek on 5/26/16.
//  Copyright © 2016 Bas Broek. All rights reserved.
//

import Foundation

struct Notification {
  let timestamp = NSDate()
  let topic: Topic
  let message: String
  
  init(topic: Topic, message: String) {
    self.topic = topic
    self.message = message
  }
}

extension Notification: CustomStringConvertible {
  
  var description: String {
    return "[\(topic)] \(message)"
  }
}

extension Notification: Hashable {
  
  var hashValue: Int {
    return topic.hashValue ^ message.hashValue
  }
}

func ==(lhs: Notification, rhs: Notification) -> Bool {
  return lhs.timestamp == rhs.timestamp && lhs.topic == rhs.topic && lhs.message == rhs.message
}
