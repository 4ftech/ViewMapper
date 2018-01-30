//
//  CellAdapters.swift
//  ViewMapper
//
//  Created by Nick Kuyakanon on 2/24/17.
//  Copyright © 2017 4f Tech. All rights reserved.
//

import Foundation

public protocol CellMapperAdapter {
  associatedtype T: ViewMappable
  
  var onSelectCell: ((UIScrollView, T.T, UIViewController?) -> Void)? { get set }
  var onDeselectCell: ((UIScrollView, T.T, UIViewController?) -> Void)? { get set }
  var onDequeueCell: ((UIScrollView, T, T.T, IndexPath) -> Void)? { get set }
  var sectionHeader: ((UIScrollView, Int) -> UIView?)? { get set }
  var sectionHeaderHeight: ((UIScrollView, Int) -> CGFloat)? { get set }
  var size: ((UIScrollView, T.T) -> CGSize)? { get set }
  var canDelete: ((UIScrollView, T.T) -> Bool)? { get set }
  var onScrollViewDidScroll: ((UIScrollView) -> Void)? { get set }
  var onScrollViewDidEndDecelerating: ((UIScrollView) -> Void)? { get set }  
  var onScrollViewDidEndDragging: ((UIScrollView, Bool) -> Void)? { get set }

  var cellTypes: [CellMapperType] { get }
  func cellIdentifier(scrollView: UIScrollView, row: T.T) -> String
}

