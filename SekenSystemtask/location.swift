//
//  location.swift
//  SekenSystemtask
//
//  Created by Karna Yarramsetty on 21/05/19.
//  Copyright © 2019 Invences. All rights reserved.
//

import Foundation
import SwiftyJSON

struct location {
    var address: String
    var crossStreet: String
    var lat: String
    var lng: String
    var postalCode: String
    var cc: String
    var city: String
    var state: String
    var country: String
    var formattedAddress:[String] = []
    init(json: JSON) {
        self.address = json["address"].stringValue
        self.crossStreet = json["crossStreet"].stringValue
        self.lat = json["lat"].stringValue
        self.lng = json["lng"].stringValue
        self.postalCode = json["postalCode"].stringValue
        self.cc = json["cc"].stringValue
        self.city = json["city"].stringValue
        self.state = json["state"].stringValue
        self.country = json["country"].stringValue
        self.formattedAddress = [json["formattedAddress"].stringValue]
    }
}
