//
//  Users.swift
//  POCVLAB
//
//  Created by NDIAYE on 03/10/2017.
//  Copyright © 2017 NDIAYE. All rights reserved.
//

import Foundation
import ObjectMapper




class Users: NSObject, Mappable {
    
    var id: Int = 0
    var name: String = ""
    var username: String = ""
    var email: String = ""
    var phone : String = ""
    var website : String = ""
    
    required init?(map: Map) {}
    
    override init() {
        super.init()
    }
    
    // Mappable
    func mapping(map: Map) {
        id    <- map["id"]
        name    <- map["name"]
        username    <- map["username"]
        email    <- map["email"]
        phone    <- map["phone"]
        website    <- map["website"]

    }
}

