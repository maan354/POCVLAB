//
//  Posts.swift
//  POCVLAB
//
//  Created by NDIAYE on 03/10/2017.
//  Copyright © 2017 NDIAYE. All rights reserved.
//

import Foundation
import ObjectMapper




class Posts: NSObject, Mappable {
    var userId: Int = 0
    var id: Int = 0
    var title: String = ""
    var body: String = ""
    
    required init?(map: Map) {}
    
    override init() {
        super.init()
    }
    
    // Mappable
    func mapping(map: Map) {
        userId    <- map["userId"]
        id    <- map["id"]
        title    <- map["title"]
        body    <- map["body"]
    }
}

