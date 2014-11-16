//
//  NewListingTableViewController.swift
//  Crashr
//
//  Created by Cezary Wojcik on 11/16/14.
//  Copyright (c) 2014 Cezary Wojcik. All rights reserved.
//

import UIKit

class NewListingTableViewController: UITableViewController {
    @IBOutlet weak var streetTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var zipTextField: UITextField!
    @IBOutlet weak var foodControl: UISegmentedControl!
    @IBOutlet weak var showerControl: UISegmentedControl!
    @IBOutlet weak var bedOrCouchControl: UISegmentedControl!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var costTextField: UITextField!

    @IBAction func createListingPressed(sender: UIButton) {
        addListing(self.streetTextField.text, self.cityTextField.text, self.stateTextField.text,
            self.zipTextField.text, self.foodControl.selectedSegmentIndex == 0, self.showerControl.selectedSegmentIndex == 0,
            self.bedOrCouchControl.selectedSegmentIndex, self.costTextField.text, self.descriptionTextField.text)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
