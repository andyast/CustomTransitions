//
//  ViewController3.swift
//  CustomTransitions
//
//  Created by Andy Steinmann on 11/26/14.
//  Copyright (c) 2014 DLS. All rights reserved.
//

import UIKit

class ViewController3: UIViewController {
  var circles:[UIView] = []
  let dotColors:[String] = ["3498DB","F1C40F","D35400","C0392B","8E44AD","2ECC71"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.loadCircles()
  }
  
  func loadCircles() {
    for i in 0..<6 {
      let circleView = self.getCircleView(self.view.center, color:UIColor.fromHexString(dotColors[i]))
      circles.append(circleView)
      self.view.addSubview(circleView)
    }
    expandDots()
  }
  
  func expandDots() {
    UIView.animateWithDuration(0.5,
      animations: {
        var index = 0
        for x in -1...1 {
          for y in [-1,1] {
            let xDistance = 15 + (x == 0 ? 10 : 0)
            let yDistance = 25
            let newX = self.circles[index].center.x + CGFloat(x * yDistance)
            let newY = self.circles[index].center.y + CGFloat(y * xDistance)
            self.circles[index].center = CGPointMake(newX, newY)
            index++
          }
        }
      }, completion: { (value: Bool) in
        self.collapseCircles()
    })
  }
  
  func collapseCircles() {
    UIView.animateWithDuration(0.5,
      animations: {
        for circle in self.circles {
          circle.center = self.view.center
        }
      }, completion: { (value: Bool) in
        self.expandBlueDot()
    })
  }
  
  func expandBlueDot() {
    for i in 1..<self.circles.count
    {
      self.circles[i].removeFromSuperview()
    }
    self.circles[0].center = self.view.center
    self.circles[0].transform = CGAffineTransformMakeScale(0, 0)
    
    UIView.animateWithDuration(0.5, delay: 0.0,
      usingSpringWithDamping: 0.5,
      initialSpringVelocity: 15.0,
      options: UIViewAnimationOptions.allZeros,
      animations: {
       self.circles[0].transform = CGAffineTransformMakeScale(1, 1)
      }, completion: {(value: Bool) in
        self.performSegueWithIdentifier("NextStep", sender: nil)
    })
  }
  
  func getCircleView(center:CGPoint, color:UIColor) -> UIView {
    let circleView = UIView(frame: CGRectMake(center.x, center.y, 8, 8))
    circleView.backgroundColor = color
    circleView.layer.cornerRadius = 4
    return circleView;
  }
}
