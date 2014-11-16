//
//  NewListingViewController.swift
//  Crashr
//
//  Created by Cezary Wojcik on 11/15/14.
//  Copyright (c) 2014 Cezary Wojcik. All rights reserved.
//

import UIKit

class NewListingViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "New Listing"
        self.navigationController?.navigationBar.barTintColor = tintColor
        self.navigationController?.navigationBar.backgroundColor = tintColor
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
}
