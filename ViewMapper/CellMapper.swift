//
//  CellMapper.swift
//  ViewMapper
//
//  Created by Nick Kuyakanon on 2/24/17.
//  Copyright © 2017 4f Tech. All rights reserved.
//

import Foundation

public class CellMapper<T: ViewMappable>: NSObject {
  public var identifier: String!
  public var nib: UINib?
  
  public required init(nib: UINib? = nil, identifier: String? = String(describing: T.self)) {
    super.init()
    
    self.nib = nib
    self.identifier = identifier
  }
  
  public init(nibName: String, identifier: String? = String(describing: T.self)) {
    super.init()
    
    self.nib = UINib(nibName: nibName, bundle: nil)
    self.identifier = identifier
  }
  
  public func register(tableView: UITableView) {
    if let nib = self.nib {
      tableView.register(nib, forCellReuseIdentifier: self.identifier)
    } else {
      tableView.register(T.self as? AnyClass, forCellReuseIdentifier: self.identifier)
    }
  }
  
  public func register(collectionView: UICollectionView) {
    if let nib = self.nib {
      collectionView.register(nib, forCellWithReuseIdentifier: self.identifier)
    } else {
      collectionView.register(T.self as? AnyClass, forCellWithReuseIdentifier: self.identifier)
    }
  }
}
