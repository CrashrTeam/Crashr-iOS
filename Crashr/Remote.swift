//
//  Remote.swift
//  Crashr
//
//  Created by Cezary Wojcik on 11/15/14.
//  Copyright (c) 2014 Cezary Wojcik. All rights reserved.
//

import Foundation
import Alamofire

// MARK: - constants

let API_URL = "http://crashr-app-test.appspot.com"
let GEOCODING_URL = "https://maps.googleapis.com/maps/api/geocode/json"
let GEO_API_KEY = "AIzaSyCV73rOsFQVDkuVUxlUYDE3PFGhVYDEJZE"

// MARK: - our api functions

func getListings(completion : [Listing] -> ()) {
    Alamofire.request(.GET, API_URL + "/getlistings", parameters: nil, encoding: .URL).responseJSON {
        (request, response, jsonRaw, error) -> () in
        if error != nil {
            println(error)
            return
        }
        let json = JSONValue(jsonRaw as [AnyObject])
        var result: [Listing] = []
        for listing in json.array as [JSONValue]! {
            let street = listing["Street_add"].string!
            let city = listing["City"].string!
            let state = listing["State"].string!
            let zip = listing["Zip"].string!
            let description = listing["Desc"].string!
            let shower = listing["Shower"].bool!
            let food = listing["Food"].bool!
            let id = listing["UID"].string!
            result.append(Listing(id: id, street: street, city: city,
                state: state, zip: zip, description: description, type: 1, shower: shower,
                cost: 50.0, image: UIImage(named: "sample.JPG"), food: food))
        }
        completion(result)
    }
}

func addListing(street: String, city: String, state: String, zip: String, food: Bool, shower: Bool, couchOrBed: Int, cost: String, desc: String) {
    //addlisting?un=berg&st_add=123%20bana%20st&city=corvallis&state=oregon&zip=97330&desc=ayy%20lmao&food=True
    let parameters = [
        "un" : "cw",
        "st_add" : street,
        "city" : city,
        "state" : state,
        "zip" : zip,
        "desc" : desc,
        "food" : food ? "true" : "false",
        "shower" : shower ? "true" : "false"
    ]
    Alamofire.request(.GET, API_URL + "/addlisting", parameters: parameters, encoding: .URL)
}

// MARK: - google api functions

func getLocation(address: String, completion: (CLLocationCoordinate2D) -> ()) {
    let geocoder = CLGeocoder()
    geocoder.geocodeAddressString(address, completionHandler: { (placemarks, error) -> Void in
        completion((placemarks[0] as CLPlacemark).location.coordinate)
    })
}