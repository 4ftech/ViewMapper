//
//  MappedCollectionView.swift
//  ViewMapper
//
//  Created by Nick Kuyakanon on 6/22/17.
//  Copyright © 2017 Oinkist. All rights reserved.
//

import Foundation
import UIKit

public class MappedCollectionView<T: CellMapperAdapter>: UICollectionView {
  public var adapter: StaticCollectionAdapter<T>!
  
}

public class NibMappedCollectionView<T: ViewMappable>: MappedCollectionView<NibCellMapperAdapter<T>> {
  
}
