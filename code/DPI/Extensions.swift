//
//  Extensions.swift
//  DPI
//
//  Created by Bas Broek on 5/26/16.
//  Copyright © 2016 Bas Broek. All rights reserved.
//

import Foundation

extension Array where Element: Equatable {
  
  public mutating func remove(object: Element) -> Bool {
    guard let index = self.indexOf(object) else { return false }
    self.removeAtIndex(index)
    
    return true
  }
  
  func removeDuplicates() -> [Element] {
    var result: [Element] = []
    
    self.forEach {
      guard !result.contains($0) else { return }
      result.append($0)
    }
    
    return result
  }
}

public func onMainQueue(closure: (Void) -> ()) {
  dispatch_async(dispatch_get_main_queue(), closure)
}

public func onBackgroundQueue(closure: (Void) -> ()) {
  dispatch_async(dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0), closure)
}

public func after(delay: Double, closure: (Void) -> ()) {
  dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(delay * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), closure)
}
