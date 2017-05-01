//
//  StaticTableController.swift
//  ViewMapper
//
//  Created by Nick Kuyakanon on 3/15/17.
//  Copyright © 2017 4f Tech. All rights reserved.
//

import Foundation
import UIKit

open class StaticTableController<T: CellMapperAdapter>: UITableViewController {
  var tableAdapter: StaticTableAdapter<T>!
  
  required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  public init(values: [T.T.T], cellAdapter: T) {
    super.init(style: .plain)
    
    self.tableAdapter = StaticTableAdapter(values: values, cellAdapter: cellAdapter)
    self.tableAdapter.viewController = self
  }
  
  override open func viewDidLoad() {
    super.viewDidLoad()
    
    tableView <- tableAdapter
  }
}
