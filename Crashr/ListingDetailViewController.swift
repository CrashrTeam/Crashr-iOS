//
//  ListingDetailViewController.swift
//  Crashr
//
//  Created by Cezary Wojcik on 11/15/14.
//  Copyright (c) 2014 Cezary Wojcik. All rights reserved.
//

import UIKit

class ListingDetailViewController: UIViewController {
    
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var fadeView: UIView!
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    @IBOutlet weak var imageView4: UIImageView!
    
    var topViewHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.topView.clipsToBounds = true
        self.imageView.contentMode = .ScaleAspectFill
        self.fadeView.backgroundColor = tintColor
        self.compressTopView(false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    func applyListing(listing: Listing) {
        // ugly hackathon code
        self.imageView.image = listing.image
        if listing.type == 1 {
            self.imageView1.image = UIImage(named: "couch_icon.png")
        } else {
            self.imageView1.image = UIImage(named: "bed_icon.png")
        }
        if listing.food {
            self.imageView2.image = UIImage(named: "dining_icon.png")
            self.imageView2.alpha = 2.0
            if listing.shower {
                self.imageView3.image = UIImage(named: "shower_icon.png")
                self.imageView3.alpha = 1.0
            } else {
                self.imageView3.alpha = 0.0
            }
        } else {
            if listing.shower {
                self.imageView2.image = UIImage(named: "shower_icon.png")
                self.imageView3.alpha = 1.0
            } else {
                self.imageView2.alpha = 0.0
            }
            self.imageView3.alpha = 0.0
        }
        self.imageView4.alpha = 0.0
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        formatter.currencyCode = "USD"
        self.priceLabel.text = formatter.stringFromNumber(listing.cost)
    }
    
    func expandTopView(animated: Bool) {
        let animationTime : NSTimeInterval = animated ? 0.5 : 0.0
        UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .CurveEaseInOut, animations: {
            if self.topViewHeightConstraint != nil {
                self.topView.removeConstraint(self.topViewHeightConstraint)
            }
            self.topViewHeightConstraint = NSLayoutConstraint(item: self.topView, attribute: .Height, relatedBy: .Equal,
                toItem: self.view, attribute: .Height, multiplier: 0.0, constant: 200.0)
            self.topView.addConstraint(self.topViewHeightConstraint)
            self.view.layoutIfNeeded()
            }) { (_) -> () in
        }
    }
    
    func compressTopView(animated: Bool) {
        let animationTime : NSTimeInterval = animated ? 0.5 : 0.0
        UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .CurveEaseInOut, animations: {
            if self.topViewHeightConstraint != nil {
                self.topView.removeConstraint(self.topViewHeightConstraint)
            }
            self.topViewHeightConstraint = NSLayoutConstraint(item: self.topView, attribute: .Height, relatedBy: .Equal,
                toItem: self.view, attribute: .Height, multiplier: 0.0, constant: 110.0)
            self.topView.addConstraint(self.topViewHeightConstraint)
            self.view.layoutIfNeeded()
            }) { (_) -> () in
        }
    }
}
