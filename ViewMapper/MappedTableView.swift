//
//  MappedTableView.swift
//  ViewMapper
//
//  Created by Nick Kuyakanon on 6/22/17.
//  Copyright © 2017 Oinkist. All rights reserved.
//

import Foundation
import UIKit

public class MappedTableView<T: CellMapperAdapter>: UITableView {
  public var adapter: StaticTableAdapter<T>!
  
}

public class NibMappedTableView<T: ViewMappable>: MappedTableView<NibCellMapperAdapter<T>> {
  
}
