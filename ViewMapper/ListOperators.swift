//
//  ListOperators.swift
//  ViewMapper
//
//  Created by Nick Kuyakanon on 2/22/17.
//  Copyright © 2017 Oinkist. All rights reserved.
//

import Foundation


// MARK: - Table/Collection Cell Adapters
public func <- <T> (left: UITableView, right: ([T.T.T], T)) where T: CellMapperAdapter {
  let (values, cellAdapter) = right
  let dataSourceDelegate = TableAdapter(values: values, cellAdapter: cellAdapter)
  
  for cellType in cellAdapter.cellTypes {
    left.register(cellType.nib, forCellReuseIdentifier: cellType.identifier)
  }
  
  left.delegate = dataSourceDelegate
  left.dataSource = dataSourceDelegate
}


public func <- <T> (left: UICollectionView, right: ([T.T.T], T)) where T: CellMapperAdapter {
  let (values, cellAdapter) = right
  let dataSourceDelegate = CollectionAdapter(values: values, cellAdapter: cellAdapter)
  
  for cellType in cellAdapter.cellTypes {
    left.register(cellType.nib, forCellWithReuseIdentifier: cellType.identifier)
  }
  
  left.delegate = dataSourceDelegate
  left.dataSource = dataSourceDelegate
}


// MARK: - Table/Collection Nibs
public func <- <T> (left: UITableView, right: ([T.T], UINib)) where T: ViewMappable, T: UITableViewCell {
  let (values, nib) = right
  
  let nibAdapter = NibCellMapperAdapter<T>(nib: nib)
  
  left <- (values, nibAdapter)
}


public func <- <T> (left: UICollectionView, right: ([T.T], UINib)) where T: ViewMappable, T: UICollectionViewCell {
  let (values, nib) = right
  
  let nibAdapter = NibCellMapperAdapter<T>(nib: nib)
  
  left <- (values, nibAdapter)
}
