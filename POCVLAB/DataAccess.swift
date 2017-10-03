//
//  DataAccess.swift
//  Cognac
//
//  Created by Anis KEDIDI on 09/02/2017.
//  Copyright © 2017 IBM. All rights reserved.
//

import Foundation
import ObjectMapper

// MARK: - Classe d'accès aux données

class DataAccess: NSObject, URLSessionDelegate {
    // Parseur Json
    let jsonParser = JSONParser()
    var session: Foundation.URLSession?
    
    var crus : Array<Cru> = Array<Cru>()
    
    override init() {
        super.init()
        let urlconfig = URLSessionConfiguration.default
        urlconfig.timeoutIntervalForRequest = 10
        self.session = URLSession(configuration: urlconfig, delegate: self, delegateQueue: nil)
    }
    
    
    func getCrus(){
        // Création du dictionnaire d'hôpitaux à renvoyer
        var results  = Array<Cru>()
        let path = Utils.checkFile(pFile: kCrusFile, pExtension: kJsonExtension)
        // Vérifier si le fichier existe
        if !path.isEmpty {
            let url = URL(fileURLWithPath: path)
            do {
                //Récupération des données
                let data = try Data(contentsOf: url)
                let json = try JSONSerialization.jsonObject(with: data,
                                                            options: [])
                    as? [[String: AnyObject]]
                results = Mapper<Cru>().mapArray(JSONObject: json)!
            }catch let error as NSError {
                print("Failed to load: \(error.localizedDescription)")
            }
        }
        self.crus = results
    }
    
    func getStackbarSettings(){
        // Création du dictionnaire d'hôpitaux à renvoyer
        var result  = StackBarSettings()
        let path = Utils.checkFile(pFile: kStackedBarsSettingsFile, pExtension: kJsonExtension)
        // Vérifier si le fichier existe
        if !path.isEmpty {
            let url = URL(fileURLWithPath: path)
            do {
                //Récupération des données
                let data = try Data(contentsOf: url)
                let json = try JSONSerialization.jsonObject(with: data,
                                                            options: [])
                    as? Dictionary<String, Any>
                result = Mapper<StackBarSettings>().map(JSONObject: json)!
            }catch let error as NSError {
                print("Failed to load: \(error.localizedDescription)")
            }
        }
        Services.sharedSession.stackBarSettings = result
    }
    
    
    func getStockEvolution(fileName : String) -> StockEvolution{
        // Création du dictionnaire d'hôpitaux à renvoyer
        var results  = StockEvolution()
        let path = Utils.checkFile(pFile: fileName, pExtension: kJsonExtension)
        // Vérifier si le fichier existe
        if !path.isEmpty {
            let url = URL(fileURLWithPath: path)
            do {
                //Récupération des données
                let data = try Data(contentsOf: url)
                let json = try JSONSerialization.jsonObject(with: data,
                                                            options: [])
                    as? Dictionary<String, Any>
                results = Mapper<StockEvolution>().map(JSONObject: json)!
            }catch let error as NSError {
                print("Failed to load: \(error.localizedDescription)")
            }
        }
        return results
    }
    
    func getStackedStock(fileName : String) -> StackedStruct{
        // Création du dictionnaire d'hôpitaux à renvoyer
        var results  = StackedStruct()
        let path = Utils.checkFile(pFile: fileName, pExtension: kJsonExtension)
        // Vérifier si le fichier existe
        if !path.isEmpty {
            let url = URL(fileURLWithPath: path)
            do {
                //Récupération des données
                let data = try Data(contentsOf: url)
                let json = try JSONSerialization.jsonObject(with: data,
                                                            options: [])
                    as? Dictionary<String, Any>
                results = Mapper<StackedStruct>().map(JSONObject: json)!
            }catch let error as NSError {
                print("Failed to load: \(error.localizedDescription)")
            }
        }
        return results
    }
    
    func getStock(fileName : String) -> VolumeTotal{
        // Création du dictionnaire d'hôpitaux à renvoyer
        var results  = VolumeTotal()
        let path = Utils.checkFile(pFile: fileName, pExtension: kJsonExtension)
        // Vérifier si le fichier existe
        if !path.isEmpty {
            let url = URL(fileURLWithPath: path)
            do {
                //Récupération des données
                let data = try Data(contentsOf: url)
                let json = try JSONSerialization.jsonObject(with: data,
                                                            options: [])
                    as? Dictionary<String, Any>
                results = Mapper<VolumeTotal>().map(JSONObject: json)!
            }catch let error as NSError {
                print("Failed to load: \(error.localizedDescription)")
            }
        }
        return results
    }
    
    typealias CompletionHandler = (_ success: Int, _ result: AnyObject ) -> Void
        typealias CompletionHandlerCru = (_ success: Int, _ result: Array<AnyObject> ) -> Void
    
    // Récupére la lot
    func getLot(lotID: String, completionHandler: @escaping CompletionHandler) {
        // Construction de l'URL
        let urlStr = kLotHistService.addingPercentEncoding(withAllowedCharacters:
            NSCharacterSet.urlQueryAllowed)! + lotID
        
        let url = URL(string: urlStr)
        var lots = Array<Lot>()
        
        let task = self.session?.dataTask(with: url!) { (data, response, error) in
            if let error = error as? NSError {
                if error.code == NSURLErrorTimedOut {
                } else {
                    completionHandler(kRequestTimeout, lots as AnyObject)
                }
            }else {
                do {
                    let json = try JSONSerialization.jsonObject(with: data!,
                                                                options: [])
                        as? [[String: AnyObject]]
                    lots = Mapper<Lot>().mapArray(JSONObject: json)!
                }catch {
                    completionHandler(kRequestFailed, lots as AnyObject)
                }
            }
        }
        task?.resume()
    }
    
    
    
    
    
//    connection  au  web  service 

    
    //  get  volCum ok
    func getStockfromWs(years : String ,monthYear : String ,cruSelected :String  ,completionHandler: @escaping CompletionHandler)  {
        Utils.loadingAnimation()
        let urlStr : String
        if (cruSelected == KallCru)
        {
            urlStr = kHostUrl.addingPercentEncoding(withAllowedCharacters:
                NSCharacterSet.urlQueryAllowed)!+Krecolte+years+Kvolcum+monthYear
        }
        else{
            urlStr = kHostUrl.addingPercentEncoding(withAllowedCharacters:
                NSCharacterSet.urlQueryAllowed)!+Krecolte+years+KcruUrl+cruSelected+Kvolcum+monthYear
        }
        
        print("url ws " + urlStr)
        let url = URL(string: urlStr)
        
        // Création du dictionnaire
        var results  = VolumeTotal()
        
        let task = self.session?.dataTask(with: url!) { (data, response, error) in
            Utils.dismissAnimation()
            if let error = error as NSError? {
                if error.code == NSURLErrorTimedOut {
                } else {
                    completionHandler(kRequestTimeout, results as AnyObject)
                }
            }else {
                do {
                    let json = try JSONSerialization.jsonObject(with: data!,
                                                                options: [])
                        as? Dictionary<String, Any>
                    results  = Mapper<VolumeTotal>().map(JSONObject: json)!
                    completionHandler(kRequestSuccess, results as AnyObject)
                }catch {
                    completionHandler(kRequestFailed, results as AnyObject)
                }
            }
        }
        task?.resume()
    }
    
    
    //    get stackedstock    ok
    func getStackedStockfromWs(years : String , monthYear : String,cruSelected : String ,graphType : GraphType ,completionHandler: @escaping CompletionHandler)   {
        Utils.loadingAnimation()
        var urlStr = ""
        print(graphType)
        if (cruSelected == KallCru)
        {
            if(graphType == GraphType.detail){
                urlStr = kHostUrl.addingPercentEncoding(withAllowedCharacters:
                    NSCharacterSet.urlQueryAllowed)!+Krecolte+years+Kfixe+monthYear
            }
            if(graphType == GraphType.company){
                urlStr = kHostUrl.addingPercentEncoding(withAllowedCharacters:
                    NSCharacterSet.urlQueryAllowed)!+Krecolte+years+Ksociete+monthYear
            }
            if(graphType == GraphType.placeStockage){
                urlStr = kHostUrl.addingPercentEncoding(withAllowedCharacters:
                    NSCharacterSet.urlQueryAllowed)!+Krecolte+years+Klieu+monthYear
            }
            if(graphType == GraphType.contenants){
                urlStr = kHostUrl.addingPercentEncoding(withAllowedCharacters:
                    NSCharacterSet.urlQueryAllowed)!+Krecolte+years+Kcontenant+monthYear
            }
        }
        else{
            if(graphType == GraphType.detail){
                print(GraphType.detail)
                urlStr = kHostUrl.addingPercentEncoding(withAllowedCharacters:
                    NSCharacterSet.urlQueryAllowed)!+Krecolte+years+KcruUrl+cruSelected+Kfixe+monthYear
                
            }
            if(graphType == GraphType.company){
                urlStr = kHostUrl.addingPercentEncoding(withAllowedCharacters:
                    NSCharacterSet.urlQueryAllowed)!+Krecolte+years+KcruUrl+cruSelected+Ksociete+monthYear
            }
            if(graphType == GraphType.placeStockage){
                urlStr = kHostUrl.addingPercentEncoding(withAllowedCharacters:
                    NSCharacterSet.urlQueryAllowed)!+Krecolte+years+KcruUrl+cruSelected+Klieu+monthYear
            }
            if(graphType == GraphType.contenants){
                urlStr = kHostUrl.addingPercentEncoding(withAllowedCharacters:
                    NSCharacterSet.urlQueryAllowed)!+Krecolte+years+KcruUrl+cruSelected+Kcontenant+monthYear
            }
        }
        print("url ws " + urlStr)
        let url = URL(string: urlStr)
        var results  = StackedStruct()
        
        let task = self.session?.dataTask(with: url!) { (data, response, error) in
            Utils.dismissAnimation()
            if let error = error as NSError? {
                if error.code == NSURLErrorTimedOut {
                } else {
                    completionHandler(kRequestTimeout, results as AnyObject)
                }
            }else {
                do {
                    let json = try JSONSerialization.jsonObject(with: data!,
                                                                options: [])
                        as? Dictionary<String, Any>
                    results  = Mapper<StackedStruct>().map(JSONObject: json)!
                    completionHandler(kRequestSuccess, results as AnyObject)
                }catch {
                    completionHandler(kRequestFailed, results as AnyObject)
                }
            }
        }
        task?.resume()
    }
    
    
    //  Recolte  ok
    func getRecolteFromWs(completionHandler: @escaping CompletionHandler)   {
        let urlStr = kHostUrl.addingPercentEncoding(withAllowedCharacters:
            NSCharacterSet.urlQueryAllowed)!+Krecolte
        let url = URL(string: urlStr)
        
        // Création du dictionnaire  VT
        var results  = [String]()
        let task = self.session?.dataTask(with: url!) { (data, response, error) in
            Utils.dismissAnimation()
            if let error = error as NSError? {
                if error.code == NSURLErrorTimedOut {
                } else {
                    completionHandler(kRequestTimeout, results as AnyObject)
                }
            }else {
                do {
                    let json = try JSONSerialization.jsonObject(with: data!,
                                                                options: [])
                        as? [String]
                    results = json!
                    completionHandler(kRequestSuccess, results as AnyObject)
                }catch {
                    completionHandler(kRequestFailed, results as AnyObject)
                }
            }
        }
        task?.resume()
    }
    //  Cru  ok
    func getCrusfromWs(completionHandler : @escaping CompletionHandlerCru)   {
        let urlStr = kHostUrl.addingPercentEncoding(withAllowedCharacters:
            NSCharacterSet.urlQueryAllowed)!+KcruUrl
        let url = URL(string: urlStr)
        var results  = Array<Cru>()
        
        let task = self.session?.dataTask(with: url!) { (data, response, error) in
            Utils.dismissAnimation()
            if let error = error as NSError? {
                if error.code == NSURLErrorTimedOut {
                } else {
                    completionHandler(kRequestTimeout, results  as Array<AnyObject>)
                }
            }else {
                do {
                    let json = try JSONSerialization.jsonObject(with: data!,
                                                                options: [])
                        as? [[String: AnyObject]]
                    results = Mapper<Cru>().mapArray(JSONObject: json)!
                    completionHandler(kRequestSuccess, results  as Array<AnyObject>)
                }catch {
                    completionHandler(kRequestFailed, results  as Array<AnyObject>)
                }
            }
        }
        task?.resume()
        
    }
    
    func getStockEvolutionfromWs(completionHandler: @escaping CompletionHandler)   {
        let urlStr = kHostUrl.addingPercentEncoding(withAllowedCharacters:
            NSCharacterSet.urlQueryAllowed)!
        let url = URL(string: urlStr)
        var results  = StockEvolution()
        let task = self.session?.dataTask(with: url!) { (data, response, error) in
            Utils.dismissAnimation()
            if let error = error as NSError? {
                if error.code == NSURLErrorTimedOut {
                } else {
                    completionHandler(kRequestTimeout, results as AnyObject)
                }
            }else {
                do {
                    let json = try JSONSerialization.jsonObject(with: data!,
                                                                options: [])
                        as? Dictionary<String, Any>
                    results  = Mapper<StockEvolution>().map(JSONObject: json)!
                    completionHandler(kRequestSuccess, results as AnyObject)                    
                }catch {
                    completionHandler(kRequestFailed, results as AnyObject)
                }
            }
        }
        task?.resume()
        
    }
    
    
    
    
    
    
    
    
    
    
}
