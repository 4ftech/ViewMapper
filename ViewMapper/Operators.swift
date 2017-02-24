//
//  Operators.swift
//  ViewMapper
//
//  Created by Nick Kuyakanon on 2/22/17.
//  Copyright © 2017 Oinkist. All rights reserved.
//

import Foundation


infix operator <-

// MARK: - Nested mappable
public func <- <MappableType: ViewMappable> (left: MappableType, right: MappableType.T) {
  left.map(object: right)
}

// MARK: - Labels
public func <- (left: UILabel, right: String?) {
  left.text = right
}


// MARK: - Images
public func <- (left: UIImageView, right: UIImage?) {
  left.image = right
}

// MARK: - Form
public func <- (left: UISwitch, right: Bool) {
  left.isOn = right
}

public func <- (left: UITextView, right: String?) {
  left.text = right
}
