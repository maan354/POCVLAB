//
//  Company.swift
//  POCVLAB
//
//  Created by NDIAYE on 03/10/2017.
//  Copyright © 2017 NDIAYE. All rights reserved.
//

import Foundation
import ObjectMapper




class Company: NSObject, Mappable {
    var name: String = ""
    var catchPhrase: String = ""
    var bs: String = ""
    
    required init?(map: Map) {}
    
    override init() {
        super.init()
    }
    
    // Mappable
    func mapping(map: Map) {
        name    <- map["name"]
        catchPhrase    <- map["catchPhrase"]
        bs    <- map["bs"]
    }
}

