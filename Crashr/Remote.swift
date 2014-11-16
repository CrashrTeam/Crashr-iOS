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

// MARK: - functions

func getListings(completion : [Listing] -> ()) {
    Alamofire.request(.GET, API_URL, parameters: nil, encoding: .URL).responseJSON {
        (request, response, jsonRaw, error) -> () in
        if error != nil {
            println(error)
            return
        }
        let json = JSONValue(jsonRaw as [AnyObject])
        var result: [Listing] = []
        for listing in json.array as [JSONValue]! {
            let latitude = listing["lat"].double!
            let longitude = listing["long"].double!
            let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            result.append(Listing(coordinates: location))
        }
        completion(result)
    }
}

