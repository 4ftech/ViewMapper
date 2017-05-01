//
//  EurekaViewMapper.swift
//  ViewMapper
//
//  Created by Nick Kuyakanon on 2/22/17.
//  Copyright © 2017 4f Tech. All rights reserved.
//

import Foundation
import ViewMapper
import Eureka

public func <- <T, U> (left: T, right: U) -> T where T:RowType, T:BaseRow, T:TypedRowType, T.Cell.Value == U {
  left.value = right
  return left
}

public func <- <T, U> (left: T, right: UnsafeMutablePointer<U?>) -> T where T:RowType, T:BaseRow, T:TypedRowType, T.Cell.Value == U {
  left.onChange() { row in
    right.pointee = row.value
  }
  left.value = right.pointee
  return left
}

public func <- <T, U> (left: T, right: UnsafeMutablePointer<U>) -> T where T:RowType, T:BaseRow, T:TypedRowType, T.Cell.Value == U {
  left.onChange() { row in
    if let value = row.value {
      right.pointee = value
    }
  }
  left.value = right.pointee
  
  return left
}

//
//public func <- (left: TextRow, right: String?) -> TextRow {
//  left.value = right
//  return left
//}
//
//public func <- (left: TextRow, right: UnsafeMutablePointer<String?>) -> TextRow {
//  left.onChange() { textRow in
//    right.pointee = textRow.value
//  }
//  left.value = right.pointee
//  
//  return left
//}
//
//public func <- (left: TextRow, right: UnsafeMutablePointer<String>) -> TextRow {
//  left.onChange() { textRow in
//    if let value = textRow.value {
//      right.pointee = value
//    } else {
//      right.pointee = ""
//    }
//  }
//  left.value = right.pointee
//  
//  return left
//}
