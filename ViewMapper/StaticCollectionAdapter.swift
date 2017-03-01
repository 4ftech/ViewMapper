//
//  CollectionAdapter.swift
//  ViewMapper
//
//  Created by Nick Kuyakanon on 2/24/17.
//  Copyright © 2017 Oinkist. All rights reserved.
//

import Foundation

// MARK: - Collection Adapter
class StaticCollectionAdapter<T: CellMapperAdapter>: NSObject, UICollectionViewDelegate, UICollectionViewDataSource {
  var values: [T.T.T]!
  var cellAdapter: T!
  
  weak var viewController: UIViewController!
  
  init(values: [T.T.T], cellAdapter: T) {
    self.values = values
    self.cellAdapter = cellAdapter
  }
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return values.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let row: T.T.T = values[indexPath.row]
    
    let identifier = cellAdapter.cellIdentifier(forRow: row)
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! T.T
    cell.map(object: row)
    return cell as! UICollectionViewCell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let row = values[indexPath.row]
    cellAdapter.onTapCell?(row, viewController)
  }
}


