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

public func <- (left: TextRow, right: (PFObject, String)) -> TextRow {
  let (object, key) = right
  left.onChange { textRow in
    object[key] = textRow.value
  }
  left.value = object[key] as? String
  return left
}

