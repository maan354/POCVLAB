//
//  Photos.swift
//  POCVLAB
//
//  Created by NDIAYE on 03/10/2017.
//  Copyright © 2017 NDIAYE. All rights reserved.
//

import Foundation
import ObjectMapper




class Photos: NSObject, Mappable {
    var albumId: Int = 0
    var id: Int = 0
    var title: String = ""
    var url: String = ""
    var thumbnailUrl: String = ""
    
    required init?(map: Map) {}
    
    override init() {
        super.init()
    }
    
    // Mappable
    func mapping(map: Map) {
        albumId    <- map["albumId"]
        id    <- map["id"]
        title    <- map["title"]
        url    <- map["url"]
        thumbnailUrl    <- map["thumbnailUrl"]
    }
}

