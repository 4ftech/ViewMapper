//
//  TableAdapter.swift
//  ViewMapper
//
//  Created by Nick Kuyakanon on 2/24/17.
//  Copyright © 2017 Oinkist. All rights reserved.
//

import Foundation

// MARK: - Table Adapter
class TableAdapter<T: CellMapperAdapter>: NSObject, UITableViewDelegate, UITableViewDataSource {
  var values: [T.T.T]!
  var cellAdapter: T!
  
  init(values: [T.T.T], cellAdapter: T) {
    self.values = values
    self.cellAdapter = cellAdapter
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return values.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let row: T.T.T = values[indexPath.row]
    
    let identifier = cellAdapter.cellIdentifier(forRow: row)
    let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! T.T
    cell.map(object: row)
    return cell as! UITableViewCell
  }
}
