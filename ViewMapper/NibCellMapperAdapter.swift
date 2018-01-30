//
//  NibCellMapperAdapter.swift
//  ViewMapper
//
//  Created by Nick Kuyakanon on 2/24/17.
//  Copyright © 2017 4f Tech. All rights reserved.
//

import Foundation

open class NibCellMapperAdapter<T: ViewMappable>: CellMapperAdapter {
  public var cellTypes: [CellMapper<T>] = []
  
  open var onSelectCell: ((T.T, UIViewController?) -> Void)? = nil
  open var onDeselectCell: ((T.T, UIViewController?) -> Void)? = nil
  open var onDequeueCell: ((T, T.T, IndexPath) -> Void)? = nil
  open var size: ((T.T) -> CGSize)? = nil
  open var canDelete: ((T.T) -> Bool)? = nil
  open var sectionHeader: ((Int) -> UIView?)? = nil
  open var sectionHeaderHeight: ((Int) -> CGFloat)? = nil
  open var onScrollViewDidScroll: ((UIScrollView) -> Void)? = nil
  open var onScrollViewDidEndDecelerating: ((UIScrollView) -> Void)? = nil
  open var onScrollViewDidEndDragging: ((UIScrollView, Bool) -> Void)? = nil
  
  public init(nib: UINib? = nil, initialize: ((NibCellMapperAdapter<T>) -> Void)? = nil) {
    self.cellTypes = [CellMapper<T>(nib: nib)]
    initialize?(self)
  }

  public init(nibName: String, initialize: ((NibCellMapperAdapter<T>) -> Void)? = nil) {
    self.cellTypes = [CellMapper<T>(nibName: nibName)]
    initialize?(self)
  }

  public init(cellMapper: CellMapper<T>, initialize: ((NibCellMapperAdapter<T>) -> Void)? = nil) {
    self.cellTypes = [cellMapper]
    initialize?(self)
  }
  
  open func cellIdentifier(forRow: T.T) -> String {
    return String(describing: T.self)
  }
}
