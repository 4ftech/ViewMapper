//
//  StaticListDelegate.swift
//  ViewMapper
//
//  Created by Nick Kuyakanon on 2/28/17.
//  Copyright © 2017 Oinkist. All rights reserved.
//

import Foundation

public protocol StaticListDelegate: class {
  func didTapCell<T>(forRow: T)
}
