//
//  Services.swift
//  Cognac
//
//  Created by Anis KEDIDI on 09/02/2017.
//  Copyright © 2017 IBM. All rights reserved.
//

import Foundation


class Services {
    
    // Création du singleton
    static let sharedSession = Services()
    
    // Accès aux données
    let  dataAccess: DataAccess = DataAccess()
    
    var stackBarSettings = StackBarSettings()

}
