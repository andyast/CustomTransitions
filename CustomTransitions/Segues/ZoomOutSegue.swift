//
//  ZoomOutSegue.swift
//  CustomTransitions
//
//  Created by Andy Steinmann on 11/26/14.
//  Copyright (c) 2014 DLS. All rights reserved.
//

import UIKit

class ZoomOutSegue: UIStoryboardSegue {
  override func perform() {
    let sourceVC = self.sourceViewController as UIViewController
    let destVC = self.destinationViewController as UIViewController
    
    sourceVC.view.alpha = 1
    destVC.view.addSubview(sourceVC.view)
    
    UIApplication.sharedApplication().keyWindow?.rootViewController = destVC
    
    UIView.animateWithDuration(0.5,
      animations: {
        sourceVC.view.transform = CGAffineTransformMakeScale(5, 5)
        sourceVC.view.alpha = 0
      }, completion: { (value: Bool) in
        sourceVC.view.removeFromSuperview()
    })
  }  
}
