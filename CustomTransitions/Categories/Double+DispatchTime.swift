//
//  Double+DispatchTime.swift
//  CustomTransitions
//
//  Created by Andy Steinmann on 11/26/14.
//  Copyright (c) 2014 DLS. All rights reserved.
//

import Foundation

extension Double {
	var dispatchTime: dispatch_time_t {
		get {
			return dispatch_time(DISPATCH_TIME_NOW,Int64(self * Double(NSEC_PER_SEC)))
		}
	}
}