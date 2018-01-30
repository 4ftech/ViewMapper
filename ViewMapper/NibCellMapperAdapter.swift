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
  
  var nib: UINib?
  
  open var onSelectCell: ((UIScrollView, Mappable.T, UIViewController?) -> Void)? = nil
  open var onDeselectCell: ((UIScrollView, Mappable.T, UIViewController?) -> Void)? = nil
  open var onDequeueCell: ((UIScrollView, Mappable, Mappable.T, IndexPath) -> Void)? = nil
  open var size: ((UIScrollView, Mappable.T) -> CGSize)? = nil
  open var canDelete: ((UIScrollView, Mappable.T) -> Bool)? = nil
  open var sectionHeader: ((UIScrollView, Int) -> UIView?)? = nil
  open var sectionHeaderHeight: ((UIScrollView, Int) -> CGFloat)? = nil
  open var onScrollViewDidScroll: ((UIScrollView) -> Void)? = nil
  open var onScrollViewDidEndDecelerating: ((UIScrollView) -> Void)? = nil
  open var onScrollViewDidEndDragging: ((UIScrollView, Bool) -> Void)? = nil
  
  public init(nib: UINib? = nil, initialize: ((NibCellMapperAdapter) -> Void)? = nil) {
    self.nib = nib
    initialize?(self)
  }
  
  open var cellTypes: [CellMapperType] {
    if let nib = nib {
      return [CellMapperType(identifier: String(describing: T.self), nib: nib)]
    } else {
      return [CellMapperType(identifier: String(describing: T.self), className: T.self as! AnyClass)]
    }
  }
  
  open func cellIdentifier(scrollView: UIScrollView, row: Mappable.T) -> String {
    return String(describing: T.self)
  }
}
