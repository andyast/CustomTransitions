//
//  ViewController2.swift
//  CustomTransitions
//
//  Created by Andy Steinmann on 11/26/14.
//  Copyright (c) 2014 DLS. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    dispatch_after(Double(1).dispatchTime, dispatch_get_main_queue()) {
      self.performSegueWithIdentifier("NextStep", sender: nil)
    }
  }
}
