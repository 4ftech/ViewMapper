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
  public var nib: UINib?
  public var className: AnyClass?
  
  public required init(identifier: String, nib: UINib) {
    super.init()
    
    self.identifier = identifier
    self.nib = nib
  }
  
  public required init(identifier: String, className: AnyClass) {
    super.init()
    
    self.identifier = identifier
    self.className = className
  }
  
  public func register(tableView: UITableView) {
    if let nib = self.nib {
      tableView.register(nib, forCellReuseIdentifier: self.identifier)
    } else if let className = self.className {
      tableView.register(className, forCellReuseIdentifier: self.identifier)
    }
  }
  
  public func register(collectionView: UICollectionView) {
    if let nib = self.nib {
      collectionView.register(nib, forCellWithReuseIdentifier: self.identifier)
    } else if let className = self.className {
      collectionView.register(className, forCellWithReuseIdentifier: self.identifier)
    }
  }
}
