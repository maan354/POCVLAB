//
//  Constants.swift
//  MyCrisis
//
//  Created by Anis KEDIDI on 24/07/2017.
//  Copyright © 2017 IBM. All rights reserved.
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
var kHostUrl = "https://mh-mycrisiswebservice.mybluemix.net/crisis"
//Code de réponse
let kRequestSuccess = 1
let kRequestTimeout = 0
let kRequestFailed = -1
let KCrisisdetail = "/getCrisisDetails"
let KMembers = "/getMember"
let KGetCrisis  = "/getCrisis"
let  KGetCrisisCell = "/getCrisisCell"
let KGetmeeting = "/getmeeting"
let KCreateMeeting = "/createMeeting"
let KEditCrisis = "/editCrisis"
let kGetCell = "/getCell"
let kGetRooms = "/getRooms"

let crisisTypes = [
    "Adverse Media campaign",
    "Damage to / theft of finished",
    "Product counterfeiting",
    "Commercial tracking",
    "Strategic risk",
    "IT crisis",
    "CSR crisis",
    "Health",
    "Distribution crisis",
    "Compliance crisis",
    "Image crisis",
    "Human Ressources crisis",
    "Responsible drinking",
    "Security breach",
]
