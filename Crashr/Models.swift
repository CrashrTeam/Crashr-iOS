//
//  Models.swift
//  Crashr
//
//  Created by Cezary Wojcik on 11/16/14.
//  Copyright (c) 2014 Cezary Wojcik. All rights reserved.
//

import Foundation

struct Listing {
    var id: String!
    var street: String!
    var city: String!
    var state: String!
    var zip: String!
    var description: String!
    var type: Int! // 0 = Bed, 1 = Couch
    var shower: Bool
    var cost: Double!
    var image: UIImage!
    var food: Bool
}
