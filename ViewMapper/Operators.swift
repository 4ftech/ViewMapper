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

// MARK: Dates
public func <- (left: UILabel, right: Date?) {
  left <- (right, "yyyy-MM-dd jj:mm")
}

public func <- (left: UILabel, right: (Date?, String)) {
  let (date, format) = right
  
  if let date = date {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: format, options: 0, locale: Locale.current)
    left.text = dateFormatter.string(from: date)
  } else {
    left.text = nil
  }
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
