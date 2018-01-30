//
//  CollectionAdapter.swift
//  ViewMapper
//
//  Created by Nick Kuyakanon on 2/24/17.
//  Copyright © 2017 4f Tech. All rights reserved.
//

import Foundation

// MARK: - Collection Adapter
public class StaticCollectionAdapter<T: CellMapperAdapter>: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  public var values: [T.T.T]!
  public var cellAdapter: T!
  
  weak var viewController: UIViewController?
  
  public init(values: [T.T.T], cellAdapter: T, viewController: UIViewController? = nil) {
    self.values = values
    self.cellAdapter = cellAdapter
    self.viewController = viewController
  }
  
  public func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return values.count
  }
  
  public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let row: T.T.T = values[indexPath.row]
    
    let identifier = cellAdapter.cellIdentifier(forRow: row)
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! T.T
    cellAdapter.onDequeueCell?(cell, row, indexPath)
    cell.map(object: row)
    
    return cell as! UICollectionViewCell
  }
  
  public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let row = values[indexPath.row]
    cellAdapter.onSelectCell?(row, viewController)
  }
  
  public func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
    let row = values[indexPath.row]
    cellAdapter.onDeselectCell?(row, viewController)
  }

  public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let row = values[indexPath.row]
    let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
    return cellAdapter.size?(row) ?? flowLayout.itemSize
  }
}


