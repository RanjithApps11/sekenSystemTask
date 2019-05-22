//
//  restarent.swift
//  SekenSystemtask
//
//  Created by Karna Yarramsetty on 21/05/19.
//  Copyright © 2019 Invences. All rights reserved.
//

import Foundation
import SwiftyJSON


struct restarent {
    var name: String
    var backgroundImageURL: String
    var category: String
    var contactArray = [contact]()
    var locationArray = [location]()
    init(json: JSON) {
         self.name = json["name"].stringValue
         self.backgroundImageURL = json["backgroundImageURL"].stringValue
        self.category = json["category"].stringValue
        if let dictionariesArray = json["contact"].array{
            self.contactArray = dictionariesArray.map({return contact(json: JSON($0))})
        }
        if let dictionariesArray = json["location"].array{
            self.locationArray = dictionariesArray.map({return location(json: JSON($0))})
        }
    }
    
}

