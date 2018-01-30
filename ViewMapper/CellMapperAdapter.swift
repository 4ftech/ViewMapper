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
  
  var onSelectCell: ((T.T, UIViewController?) -> Void)? { get set }
  var onDeselectCell: ((T.T, UIViewController?) -> Void)? { get set }
  var onDequeueCell: ((T, T.T, IndexPath) -> Void)? { get set }
  var sectionHeader: ((Int) -> UIView?)? { get set }
  var sectionHeaderHeight: ((Int) -> CGFloat)? { get set }
  var size: ((T.T) -> CGSize)? { get set }
  var canDelete: ((T.T) -> Bool)? { get set }
  var onScrollViewDidScroll: ((UIScrollView) -> Void)? { get set }
  var onScrollViewDidEndDecelerating: ((UIScrollView) -> Void)? { get set }  
  var onScrollViewDidEndDragging: ((UIScrollView, Bool) -> Void)? { get set }

  var cellTypes: [CellMapper<T>] { get }
  func cellIdentifier(forRow: T.T) -> String
}

