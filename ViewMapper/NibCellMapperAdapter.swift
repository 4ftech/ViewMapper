//
//  NibCellMapperAdapter.swift
//  ViewMapper
//
//  Created by Nick Kuyakanon on 2/24/17.
//  Copyright © 2017 4f Tech. All rights reserved.
//

import Foundation

open class NibCellMapperAdapter<Mappable: ViewMappable>: CellMapperAdapter {
  public typealias T = Mappable
  
  var nib: UINib!
  
  public var canDelete: ((Mappable.T) -> Bool)? = nil
  public var onSelectCell: ((Mappable.T, UIViewController?) -> Void)? = nil
  public var onDeselectCell: ((Mappable.T, UIViewController?) -> Void)? = nil
  public var onDequeueCell: ((Mappable) -> Void)? = nil
  public var size: ((Mappable.T) -> CGSize)? = nil
  
  public init(nib: UINib, initializer: ((NibCellMapperAdapter) -> Void)? = nil) {
    self.nib = nib
    initializer?(self)
  }
  
  public convenience init(nibName: String, initializer: ((NibCellMapperAdapter) -> Void)? = nil) {
    self.init(nib: UINib(nibName: nibName, bundle: nil), initializer: initializer)
  }
  
  open var cellTypes: [CellMapperType] {
    return [CellMapperType(identifier: String(nib.hashValue), nib: nib)]
  }
  
  open func cellIdentifier(forRow row: Mappable.T) -> String {
    return String(nib.hashValue)
  }
}
