//
//  CellMapperType.swift
//  ViewMapper
//
//  Created by Nick Kuyakanon on 2/24/17.
//  Copyright © 2017 4f Tech. All rights reserved.
//

import Foundation

public class CellMapperType: NSObject {
  public var identifier: String!
  public var nib: UINib!
  
  public required init(identifier: String, nib: UINib) {
    super.init()
    
    self.identifier = identifier
    self.nib = nib
  }
  
  public convenience init(identifier: String, nibName: String) {
    self.init(identifier: identifier, nib: UINib(nibName: nibName, bundle: nil))
  }
}
