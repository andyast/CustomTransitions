//
//  ZoomInSegue.swift
//  CustomTransitions
//
//  Created by Andy Steinmann on 11/26/14.
//  Copyright (c) 2014 DLS. All rights reserved.
//

import UIKit

class ZoomInSegue: UIStoryboardSegue {
	override func perform() {
		let sourceVC = self.sourceViewController as UIViewController
		let destVC = self.destinationViewController as UIViewController
		
    //Code taken from: http://www.raywenderlich.com/84043/ios-8-visual-effects-tutorial
    UIGraphicsBeginImageContextWithOptions(sourceVC.view.bounds.size, true, 1)
    sourceVC.view.drawViewHierarchyInRect(sourceVC.view.bounds, afterScreenUpdates: true)
    let screenshot = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    let blur = screenshot.applyDarkEffect()
    
    let blurredImageView = UIImageView(image: blur)
    destVC.view.insertSubview(blurredImageView, atIndex: 0)
		destVC.view.transform = CGAffineTransformMakeScale(5, 5)
    destVC.view.alpha = 0
		
    sourceVC.view.addSubview(destVC.view)
    
		UIView.animateWithDuration(0.5,
			animations: {
				destVC.view.transform = CGAffineTransformMakeScale(1, 1)
        destVC.view.alpha = 1
			}, completion: { (value: Bool) -> Void in
        destVC.view.removeFromSuperview()
        UIApplication.sharedApplication().keyWindow?.rootViewController = destVC
      })
	}
}
