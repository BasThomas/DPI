//
//  Notification.swift
//  DPI
//
//  Created by Bas Broek on 5/26/16.
//  Copyright © 2016 Bas Broek. All rights reserved.
//

import Foundation

struct Notification {
  let topic: Topic
  let message: String
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
  return lhs.topic == rhs.topic && lhs.message == rhs.message
}
