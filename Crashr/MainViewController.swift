//
//  MainViewController.swift
//  Crashr
//
//  Created by Cezary Wojcik on 11/15/14.
//  Copyright (c) 2014 Cezary Wojcik. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, CLLocationManagerDelegate, GMSMapViewDelegate {

    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var listingsButton: BFPaperButton!
    @IBOutlet weak var statusBarView: UIView!
    
    var detailViewController : ListingDetailViewController!
    
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
        
        // map setup
        self.mapView.myLocationEnabled = true
        self.mapView.settings.myLocationButton = true
        self.mapView.delegate = self
        
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
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    // MARK: - Map View Delegate
    
    func mapView(mapView: GMSMapView!, didTapMarker marker: GMSMarker!) -> Bool {
        self.mapView.settings.myLocationButton = false
        return true
    }
    
    func mapView(mapView: GMSMapView!, didTapAtCoordinate coordinate: CLLocationCoordinate2D) {
        self.mapView.settings.myLocationButton = true
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
