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
  left <- (right, nil)
}

public func <- (left: UIImageView, right: (String?, UIImage?)) {
  let (string, defaultImage) = right

  if let string = string {
    left <- (URL(string: string), defaultImage)
  } else {
    left.image = nil
  }
}

public func <- (left: UIImageView, right: URL?) {
  left <- (right, nil)
}

public func <- (left: UIImageView, right: (URL?, UIImage?)) {
  left.image = nil

  let (url, defaultImage) = right
  
  if let url = url {
    left.hnk_setImageFromURL(
      url,
      placeholder: nil,
      format: nil,
      failure: { error in
        if let defaultImage = defaultImage {
          UIView.transition(with: left, duration: 0.3, options: .transitionCrossDissolve, animations: {
            left.image = defaultImage
          }, completion: nil)
        }
      },
      success: { image in
        left.hnk_fetcher = nil
        
        UIView.transition(with: left, duration: 0.3, options: .transitionCrossDissolve, animations: {
          left.image = image
        }, completion: nil)
      }
    )
  }
}

