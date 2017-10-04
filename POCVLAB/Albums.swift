//
//  Albums.swift
//  POCVLAB
//
//  Created by NDIAYE on 03/10/2017.
//  Copyright © 2017 NDIAYE. All rights reserved.
//

import Foundation
import ObjectMapper

// Representation du modèle Crisis


class Albums: NSObject, Mappable {
    var userId: Int = 0
    var id: Int = 0
    var title: String = ""
    
    
    required init?(map: Map) {}
    
    override init() {
        super.init()
    }
    
    // Mappable
    func mapping(map: Map) {
        userId    <- map["userId"]
        id    <- map["id"]
        title    <- map["title"]
    }
}

