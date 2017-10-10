//
//  ListOperators.swift
//  ViewMapper
//
//  Created by Nick Kuyakanon on 2/22/17.
//  Copyright © 2017 4f Tech. All rights reserved.
//

import Foundation


// MARK: - Table Cell Adapters
public func <- <T> (left: UITableView, right: StaticTableAdapter<T>) {
  for cellType in right.cellAdapter.cellTypes {
    left.register(cellType.nib, forCellReuseIdentifier: cellType.identifier)
  }
  
  left.delegate = right
  left.dataSource = right
  left.reloadData()
}

public func <- <T> (left: MappedTableView<T>, right: ([T.T.T], T)) {
  let (values, cellAdapter) = right
  
  left.adapter = StaticTableAdapter(values: values, cellAdapter: cellAdapter)
  
  for cellType in cellAdapter.cellTypes {
    left.register(cellType.nib, forCellReuseIdentifier: cellType.identifier)
  }
  
  left.delegate = left.adapter
  left.dataSource = left.adapter
  left.reloadData()
}

public func <- <T> (left: MappedTableView<NibCellMapperAdapter<T>>, right: ([T.T], UINib)) where T: UITableViewCell {
  let (values, nib) = right

  let nibAdapter = NibCellMapperAdapter<T>(nib: nib)

  left <- (values, nibAdapter)
}

// MARK: - Collection Cell Adapters
public func <- <T> (left: UICollectionView, right: StaticCollectionAdapter<T>) {
  for cellType in right.cellAdapter.cellTypes {
    left.register(cellType.nib, forCellWithReuseIdentifier: cellType.identifier)
  }
  
  left.delegate = right
  left.dataSource = right
  left.reloadData()
}

public func <- <T> (left: MappedCollectionView<T>, right: ([T.T.T], T)) {
  let (values, cellAdapter) = right

  left.adapter = StaticCollectionAdapter(values: values, cellAdapter: cellAdapter)

  for cellType in cellAdapter.cellTypes {
    left.register(cellType.nib, forCellWithReuseIdentifier: cellType.identifier)
  }
  
  left.delegate = left.adapter
  left.dataSource = left.adapter
  left.reloadData()
}

public func <- <T> (left: MappedCollectionView<NibCellMapperAdapter<T>>, right: ([T.T], UINib)) where T: UICollectionViewCell {
  let (values, nib) = right

  let nibAdapter = NibCellMapperAdapter<T>(nib: nib)

  left <- (values, nibAdapter)
}

