//
//  CellAdapters.swift
//  ViewMapper
//
//  Created by Nick Kuyakanon on 2/24/17.
//  Copyright © 2017 Oinkist. All rights reserved.
//

import Foundation

public protocol CellMapperAdapter {
  associatedtype T: ViewMappable
  
  var cellTypes: [CellMapperType] { get }
  func cellIdentifier(forRow row: T.T) -> String
  func didTapCell(forRow row: T.T)
}


