//
//  CircleMaskSegue.swift
//  CustomTransitions
//
//  Created by Andy Steinmann on 11/26/14.
//  Copyright (c) 2014 DLS. All rights reserved.
//

import UIKit

class CircleMaskSegue: UIStoryboardSegue {
  override func perform()
  {
    let sourceVC = self.sourceViewController as UIViewController
    let destVC = self.destinationViewController as UIViewController
    
    sourceVC.view.addSubview(destVC.view)
    
    

    let layer = CAShapeLayer()
    destVC.view.layer.mask = layer
    
    let endPathRadius = max(CGRectGetHeight(destVC.view.frame), CGRectGetWidth(destVC.view.frame))
    
    let startPath = UIBezierPath(arcCenter: sourceVC.view.center, radius:8.0, startAngle: 0.0, endAngle: CGFloat(M_PI * 2), clockwise: true)
    let endPath = UIBezierPath(arcCenter: sourceVC.view.center, radius:endPathRadius, startAngle: 0.0, endAngle: CGFloat(M_PI * 2), clockwise: true)
    
    let animation = CABasicAnimation(keyPath: "path")
    animation.duration = 1
    animation.fromValue = startPath.CGPath
    animation.toValue = endPath.CGPath
    
    CATransaction.begin()
    CATransaction.setCompletionBlock {
        destVC.view.removeFromSuperview()
        UIApplication.sharedApplication().keyWindow?.rootViewController = destVC
    }
    
    layer.addAnimation(animation, forKey: "path")
    layer.path = endPath.CGPath
    CATransaction.commit()
  }
}
