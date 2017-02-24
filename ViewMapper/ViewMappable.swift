//
//  ViewMappable.swift
//  ViewMappable
//
//  Created by Nick Kuyakanon on 2/21/17.
//  Copyright © 2017 Oinkist. All rights reserved.
//

import Foundation

public protocol ViewMappable {
  associatedtype T
  
  func map(object: T)
}

