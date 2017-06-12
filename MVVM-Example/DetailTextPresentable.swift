//
//  DetailTextPresentable.swift
//  MVVM-Example
//
//  Created by Ivan Magda on 08/09/16.
//  Copyright © 2016 Ivan Magda. All rights reserved.
//

import UIKit

protocol DetailTextPresentable: TextPresentable {
  var detailText: String { get }
  var detailTextColor: UIColor { get }
  var detailFont: UIFont { get }
}

extension DetailTextPresentable {
  
  var detailTextColor: UIColor {
    return .lightGray
  }
  
  var detailFont: UIFont {
    return .systemFont(ofSize: 14)
  }
  
}
