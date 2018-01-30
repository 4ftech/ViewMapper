//
//  HanekeViewMapper.swift
//  ViewMapper
//
//  Created by Nick Kuyakanon on 2/22/17.
//  Copyright © 2017 4f Tech. All rights reserved.
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
  left.image = nil
  
  if let url = right {
    left.hnk_setImageFromURL(url, placeholder: nil, format: nil, failure: nil, success: { image in
      left.hnk_setImage(image, animated: true, success: nil)
    })
  }
}

