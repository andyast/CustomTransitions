//
//  UIColor+Utils.swift
//  CustomTransitions
//
//  Created by Andy Steinmann on 12/1/14.
//  Copyright (c) 2014 DLS. All rights reserved.
//

import UIKit

extension UIColor {
  class func fromHexString(hexString:String) -> UIColor {
    let scanner = NSScanner(string: hexString)
    scanner.charactersToBeSkipped = NSCharacterSet.symbolCharacterSet()
    var baseColor = 0 as uint
    scanner.scanHexInt(&baseColor)
    
    var alpha = 1.0 as CGFloat
    if countElements(hexString) == 8 {
      alpha = CGFloat(Double((baseColor & 0xFF000000) >> 24) / 255)
    }
    if alpha == 0 {
      return UIColor.clearColor()
    }
    
    let red = CGFloat(Double((baseColor & 0xFF0000) >> 16) / 255.0)
    let green = CGFloat(Double((baseColor & 0x00FF00) >> 8) / 255.0)
    let blue = CGFloat(Double(baseColor & 0x0000FF) / 255.0)
    
    return UIColor(red: red, green: green, blue: blue, alpha: alpha)
  }
}

