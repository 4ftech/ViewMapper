//
//  EurekaViewMapper.swift
//  ViewMapper
//
//  Created by Nick Kuyakanon on 2/22/17.
//  Copyright © 2017 Oinkist. All rights reserved.
//

import Foundation
import ViewMapper
import Eureka

public func <- (left: TextRow, right: String?) -> TextRow {
  left.value = right
  return left
}

public func <- (left: TextRow, right: UnsafeMutablePointer<String?>) -> TextRow {
  left.onChange() { textRow in
    right.pointee = textRow.value
  }
  left.value = right.pointee
  
  return left
}

public func <- (left: TextRow, right: UnsafeMutablePointer<String>) -> TextRow {
  left.onChange() { textRow in
    if let value = textRow.value {
      right.pointee = value
    } else {
      right.pointee = ""
    }
  }
  left.value = right.pointee
  
  return left
}
