//
//  ViewMappableController.swift
//  ViewMapper
//
//  Created by Nick Kuyakanon on 3/1/17.
//  Copyright © 2017 Oinkist. All rights reserved.
//

import Foundation

open class ViewMappableController<T: ViewMappable>: UIViewController {
  var object: T.T!
  
  required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  public init(object: T.T, nibName: String) {
    super.init(nibName: nibName, bundle: nil)
    
    self.object = object
  }
  
  override open func viewDidLoad() {
    super.viewDidLoad()
    
    if let view = self.view as? T {
      view.map(object: object)
    }
  }
}
