//
//  MainViewController.swift
//  Crashr
//
//  Created by Cezary Wojcik on 11/15/14.
//  Copyright (c) 2014 Cezary Wojcik. All rights reserved.
//

import UIKit
import QuartzCore

class MainViewController: UIViewController, CLLocationManagerDelegate, GMSMapViewDelegate {

    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var listingsButton: BFPaperButton!
    @IBOutlet weak var statusBarView: UIView!
    @IBOutlet weak var bottomView: UIView!
    
    var bottomViewHeightConstraint: NSLayoutConstraint!
    var bottomViewController: ListingDetailViewController!
    var tapGestureRecognizer: UITapGestureRecognizer!
    
    let manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // user location
        self.manager.delegate = self
        self.manager.requestWhenInUseAuthorization()
        
        // listings button setup
        self.listingsButton.cornerRadius = self.listingsButton.frame.size.width/2
        self.listingsButton.backgroundColor = tintColor
        self.listingsButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.listingsButton.setTitleColor(UIColor.whiteColor(), forState: .Highlighted)
        self.listingsButton.tapCircleColor = UIColor.paperColorBrown400()
        
        // status bar view setup
        self.statusBarView.backgroundColor = tintColor
        
        // bottom view setup
        self.bottomView.layer.shadowColor = tintColor.CGColor
        self.bottomView.layer.shadowRadius = 4.0
        self.bottomView.layer.shadowOpacity = 0.50
        self.hideBottomBar(false)
        
        // map setup
        self.mapView.myLocationEnabled = true
        self.mapView.settings.myLocationButton = true
        self.mapView.delegate = self
        
        // tap gesture recognizer
        self.tapGestureRecognizer = UITapGestureRecognizer(target: self, action: "handleTap:")
        self.tapGestureRecognizer.numberOfTapsRequired = 1
        self.bottomView.addGestureRecognizer(self.tapGestureRecognizer)
        
        // test map marker
        let marker = GMSMarker(position: CLLocationCoordinate2D(latitude: 44.5666415, longitude: -123.2788342))
        marker.title = "Test Marker"
        marker.map = self.mapView
    }
    
    override func viewDidAppear(animated: Bool) {
        delay(0.1) {
            let update = GMSCameraUpdate.setTarget(self.mapView.myLocation.coordinate)
            self.mapView.animateWithCameraUpdate(update)
            self.mapView.animateToZoom(15.0)
            self.bottomViewController = self.storyboard?.instantiateViewControllerWithIdentifier("listingDetail") as ListingDetailViewController
            self.bottomView.addSubview(self.bottomViewController.view)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    // MARK: - tap gesture handlers
    
    func handleTap(sender: AnyObject) {
        self.expandBottomBar(true)
    }
    
    // MARK: - constraint manipulation
    
    func hideBottomBar(animated: Bool) {
        let animationTime : NSTimeInterval = animated ? 0.5 : 0.0
        UIView.animateWithDuration(animationTime, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.9,
            options: .CurveEaseInOut, animations: { () -> () in
                if self.bottomViewHeightConstraint != nil {
                    self.bottomView.removeConstraint(self.bottomViewHeightConstraint)
                }
                self.bottomViewHeightConstraint = NSLayoutConstraint(item: self.bottomView, attribute: .Height, relatedBy: .Equal,
                    toItem: self.view, attribute: .Height, multiplier: 0.0, constant: 0.0)
                self.bottomView.addConstraint(self.bottomViewHeightConstraint)
                self.view.layoutIfNeeded()
                self.mapView.settings.myLocationButton = true
            }) { (_) -> () in
        }
    }
    
    func showBottomBar(animated: Bool) {
        let animationTime : NSTimeInterval = animated ? 0.5 : 0.0
        UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .CurveEaseInOut, animations: {
            if self.bottomViewHeightConstraint != nil {
                self.bottomView.removeConstraint(self.bottomViewHeightConstraint)
            }
            self.bottomViewHeightConstraint = NSLayoutConstraint(item: self.bottomView, attribute: .Height, relatedBy: .Equal,
                toItem: self.view, attribute: .Height, multiplier: 0.0, constant: 100.0)
            self.bottomView.addConstraint(self.bottomViewHeightConstraint)
            self.view.layoutIfNeeded()
            self.mapView.settings.myLocationButton = false
            }) { (_) -> () in
        }
    }
    
    func expandBottomBar(animated: Bool) {
        self.bottomViewController.expandTopView(animated)
        let animationTime : NSTimeInterval = animated ? 0.5 : 0.0
        UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .CurveEaseInOut, animations: {
            if self.bottomViewHeightConstraint != nil {
                self.bottomView.removeConstraint(self.bottomViewHeightConstraint)
            }
            self.bottomViewHeightConstraint = NSLayoutConstraint(item: self.bottomView, attribute: .Top, relatedBy: .Equal,
                toItem: self.topLayoutGuide, attribute: .Bottom, multiplier: 0.0, constant: 200.0)
            self.bottomView.addConstraint(self.bottomViewHeightConstraint)
            self.view.layoutIfNeeded()
            }) { (_) -> () in
        }
    }
    
    func contractBottomBar(animated: Bool) {
        let animationTime : NSTimeInterval = animated ? 0.5 : 0.0
    }
    
    // MARK: - Map View Delegate
    
    func mapView(mapView: GMSMapView!, didTapMarker marker: GMSMarker!) -> Bool {
        self.showBottomBar(true)
        return true
    }
    
    func mapView(mapView: GMSMapView!, didTapAtCoordinate coordinate: CLLocationCoordinate2D) {
        self.hideBottomBar(true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
