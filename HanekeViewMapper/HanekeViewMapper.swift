//
//  HanekeViewMapper.swift
//  ViewMapper
//
//  Created by Nick Kuyakanon on 2/22/17.
//  Copyright © 2017 Oinkist. All rights reserved.
//


import Foundation
import Haneke
import ViewMapper

public func <- (left: UIImageView, right: String?) {
  if let string = right {
    left <- URL(string: string)
  } else {
    left.image = nil
  }
}

public func <- (left: UIImageView, right: URL?) {
  if let url = right {
    left.hnk_setImageFromURL(url)
  } else {
    left.image = nil
  }
}

