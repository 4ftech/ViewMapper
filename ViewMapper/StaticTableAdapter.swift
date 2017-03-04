//
//  TableAdapter.swift
//  ViewMapper
//
//  Created by Nick Kuyakanon on 2/24/17.
//  Copyright © 2017 Oinkist. All rights reserved.
//

import Foundation

// MARK: - Table Adapter
public class StaticTableAdapter<T: CellMapperAdapter>: NSObject, UITableViewDelegate, UITableViewDataSource {
  public var values: [T.T.T]!
  public var cellAdapter: T!
  
  weak var viewController: UIViewController!
  
  public init(values: [T.T.T], cellAdapter: T) {
    self.values = values
    self.cellAdapter = cellAdapter
  }
  
  public func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return values.count
  }
  
  public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let row: T.T.T = values[indexPath.row]
    
    let identifier = cellAdapter.cellIdentifier(forRow: row)

    let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! T.T
    
    cell.map(object: row)
    
    return cell as! UITableViewCell
  }
  
  public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let row = values[indexPath.row]
    cellAdapter.onTapCell?(row, viewController)
  }  
}
