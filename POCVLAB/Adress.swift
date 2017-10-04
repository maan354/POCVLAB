
//
//  Adress.swift
//  POCVLAB
//
//  Created by NDIAYE on 03/10/2017.
//  Copyright © 2017 NDIAYE. All rights reserved.
//

import Foundation
import ObjectMapper




class Adress: NSObject, Mappable {

    var street: String = ""
    var suite: String = ""
    var zipcode: String = ""
    var city : String =  ""
    
    required init?(map: Map) {}
    
    override init() {
        super.init()
    }
    
    // Mappable
    func mapping(map: Map) {
        street    <- map["street"]
        suite    <- map["suite"]
        zipcode    <- map["zipcode"]
        city    <- map["city"]
       
    }
}

