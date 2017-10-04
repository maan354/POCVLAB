//
//  PostVC.swift
//  POCVLAB
//
//  Created by NDIAYE on 02/10/2017.
//  Copyright © 2017 NDIAYE. All rights reserved.
//


import Foundation
import UIKit


// MARK: - Constantes pour l'application
var kValueString: String = ""


// MARK: - Fichier Json crisis
var kCrisisListFile = "crisis_list"
var kCrisisDetailsFile = "crisis_details"
var kMeetingsListFile = "meetings_list"
var kDocumentsListFile = "documents_list"
var kContactsListFile = "contacts_list"
var kJsonExtension = ".json"

// MARK: - Couleurs
var kColorMH: UIColor = UIColor(rgb: 0xDCC8A6 )

var kColorWhite: UIColor = UIColor(red: 1, green: 1, blue: 1,
                                   alpha: 1.0)
var kGreyField: UIColor = UIColor(rgb:0xCCCCCC)
var kHostUrl = "https://jsonplaceholder.typicode.com"
//Code de réponse
let kRequestSuccess = 1
let kRequestTimeout = 0
let kRequestFailed = -1

let KGetUser = "/users"
let KGetPhotos = "/photos"
let KGetAlbums  = "/albums"
let KGetPost  = "/posts"


