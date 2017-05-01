//
//  ParseEurekaViewMapper.swift
//  ViewMapper
//
//  Created by Nick Kuyakanon on 2/28/17.
//  Copyright © 2017 4f Tech. All rights reserved.
//

import Foundation
import ViewMapper
import Eureka
import Parse

public func <- <T, U> (left: T, right: (PFObject, String)) -> T where T:RowType, T:BaseRow, T:TypedRowType, T.Cell.Value == U {
  let (object, key) = right
  left.onChange { textRow in
    if let value = textRow.value {
      object[key] = value
    } else {
      object.remove(forKey: key)
    }
  }
  left.value = object[key] as? U
  return left
}

