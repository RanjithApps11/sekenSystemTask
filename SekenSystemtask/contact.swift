//
//  contact.swift
//  SekenSystemtask
//
//  Created by Karna Yarramsetty on 21/05/19.
//  Copyright © 2019 Invences. All rights reserved.
//

import Foundation
import SwiftyJSON
struct contact {
    var phone: String
    var formattedPhone: String
    var twitter: String
    init(json: JSON) {
        self.phone = json["phone"].stringValue
        self.formattedPhone = json["formattedPhone"].stringValue
        self.twitter = json["twitter"].stringValue
    }
}
