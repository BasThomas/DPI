//
//  Topic.swift
//  DPI
//
//  Created by Bas Broek on 5/26/16.
//  Copyright © 2016 Bas Broek. All rights reserved.
//

import Foundation

enum Topic: String {
  case battery
  case done
  case started
  case warning
  case error
  case all
  
  static let cases = [battery, done, started, warning, error]
}
