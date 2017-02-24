//
//  NibCellMapperAdapter.swift
//  ViewMapper
//
//  Created by Nick Kuyakanon on 2/24/17.
//  Copyright © 2017 Oinkist. All rights reserved.
//

import Foundation

class NibAdapter<MappableType: ViewMappable>: CellMapperAdapter {
  typealias T = MappableType
  
  var nib: UINib!
  
  required public init() {
    
  }
  
  init(nib: UINib) {
    self.nib = nib
  }
  
  var cellTypes: [CellMapperType] {
    return [CellMapperType(identifier: String(nib.hashValue), nib: nib)]
  }
  
  func cellIdentifier(forRow row: T.T) -> String {
    return String(nib.hashValue)
  }
  
  func didTapCell(forRow row: T.T) {
    
  }
}
