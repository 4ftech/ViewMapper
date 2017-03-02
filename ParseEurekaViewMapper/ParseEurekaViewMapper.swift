//
//  ParseEurekaViewMapper.swift
//  ViewMapper
//
//  Created by Nick Kuyakanon on 2/28/17.
//  Copyright © 2017 Oinkist. All rights reserved.
//

import Foundation
import ViewMapper
import Eureka
import Parse

public func <- <T, U> (left: T, right: (PFObject, String)) -> T where T:RowType, T:BaseRow, T:TypedRowType, T.Cell.Value == U {
  let (object, key) = right
  left.onChange { textRow in
    object[key] = textRow.value
  }
  left.value = object[key] as? U
  return left
}

