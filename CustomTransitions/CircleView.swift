//
//  CircleView.swift
//  CustomTransitions
//
//  Created by Andy Steinmann on 11/26/14.
//  Copyright (c) 2014 DLS. All rights reserved.
//

import UIKit



class CircleView: UIView {
  
  override init() {
    super.init()
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  
  override func drawRect(rect: CGRect) {
    let context = UIGraphicsGetCurrentContext()
    CGContextSetLineWidth(context, 10.0)
    UIColor.redColor().set()
    
    let radius:CGFloat = frame.size.width / 2.0
    let x = center.x
    let y = center.y
    
    CGContextAddArc(context, x,y, radius, 0.0, CGFloat(M_PI * 2.0), 1)
    CGContextStrokePath(context)
    //UIGraphicsEndImageContext()
  }
  
  
  /*
  // Get the Graphics Context
  CGContextRef context = UIGraphicsGetCurrentContext();
  // Set the circle outerline-width
  CGContextSetLineWidth(context, 10.0);
  // Set the circle outerline-colour
  [[UIColor redColor] set];
  
  
  // Loop through the circles and Draw these Circles to the view
  for (iOSCircle *circle in totalCircles) {
  // Create Circle
  CGContextAddArc(context, circle.circleCenter.x, circle.circleCenter.y, circle.circleRadius, 0.0, M_PI * 2.0, YES);
  // Draw
  CGContextStrokePath(context);
  }
  */
}
