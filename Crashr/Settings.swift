//
//  Settings.swift
//  Crashr
//
//  Created by Cezary Wojcik on 11/15/14.
//  Copyright (c) 2014 Cezary Wojcik. All rights reserved.
//

import Foundation

let tintColor = UIColor.paperColorBrown700()
let fontName = "Avenir"

// adapted from http://stackoverflow.com/a/24318861/1701975
func delay(delay : Double, closure : () -> ()) {
    dispatch_after(
        dispatch_time(
            DISPATCH_TIME_NOW,
            Int64(delay * Double(NSEC_PER_SEC))
        ),
        dispatch_get_main_queue(), closure)
}
