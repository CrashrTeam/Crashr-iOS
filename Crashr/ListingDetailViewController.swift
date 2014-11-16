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
    
    var topViewHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.topView.clipsToBounds = true
        self.imageView.contentMode = .ScaleAspectFill
        self.fadeView.backgroundColor = tintColor
        self.compressTopView(false)
        
        // sample data
        self.showImage(UIImage(named: "sample.JPG")!)
        self.addressLabel.text = "Swag Engineering Center, Corvallis, OR"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    func showImage(image: UIImage) {
        self.imageView.image = image
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
