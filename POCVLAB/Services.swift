//
//  PostVC.swift
//  POCVLAB
//
//  Created by NDIAYE on 02/10/2017.
//  Copyright © 2017 NDIAYE. All rights reserved.
//

import Foundation


class Services {
    
    // Création du singleton
    static let sharedSession = Services()
    
    // Accès aux données
    let  dataAccess: DataAccess = DataAccess()
    

}
