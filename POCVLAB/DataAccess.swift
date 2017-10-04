//
//  PostVC.swift
//  POCVLAB
//
//  Created by NDIAYE on 02/10/2017.
//  Copyright © 2017 NDIAYE. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper

// MARK: - Classe d'accès aux données

class DataAccess: NSObject, URLSessionDelegate {
    // Parseur Json

    var session: Foundation.URLSession?
    
    var users : Array<Users> = Array<Users>()
    var selectedUser = Int()
    var selectedUserName = ""
    var selectedAlbum = Int()
    
    override init() {
        super.init()
        let urlconfig = URLSessionConfiguration.default
        urlconfig.timeoutIntervalForRequest = 10
        self.session = URLSession(configuration: urlconfig, delegate: self, delegateQueue: nil)
    }
    
    
   
    
    typealias CompletionHandler = (_ success: Int, _ result: AnyObject ) -> Void
    
    
  
    
    //  Get Users
    func getUsers(completionHandler : @escaping CompletionHandler)   {
        let urlStr = kHostUrl.addingPercentEncoding(withAllowedCharacters:
            NSCharacterSet.urlQueryAllowed)!+KGetUser
        let url = URL(string: urlStr)
        
        // Création du dictionnaire  VT
        var results  =  Array<Users>()
        let task = self.session?.dataTask(with: url!) { (data, response, error) in
            if let error = error as NSError? {
                
                if error.code == NSURLErrorTimedOut {
                } else {
                    completionHandler(kRequestTimeout, results as AnyObject)
                }
            }else {
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: [])as? [[String: AnyObject]]
                    results = Mapper<Users>().mapArray(JSONObject: json)!
//                    print(results)
//                    print(json)
                    completionHandler(kRequestSuccess, results as AnyObject)
                }catch {
                    completionHandler(kRequestFailed, results as  AnyObject)
                }
            }
        }
        task?.resume()
        
    }
    
    
    
    
    //  Get Users
    func getAlbums(completionHandler : @escaping CompletionHandler)   {
        let urlStr = kHostUrl.addingPercentEncoding(withAllowedCharacters:
            NSCharacterSet.urlQueryAllowed)!+KGetAlbums
        let url = URL(string: urlStr)
        
        // Création du dictionnaire  VT
        var results  =  Array<Albums>()
        let task = self.session?.dataTask(with: url!) { (data, response, error) in
            if let error = error as NSError? {
                
                if error.code == NSURLErrorTimedOut {
                } else {
                    completionHandler(kRequestTimeout, results as AnyObject)
                }
            }else {
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: [])as? [[String: AnyObject]]
                    results = Mapper<Albums>().mapArray(JSONObject: json)!
                    //                    print(results)
                    //                    print(json)
                    completionHandler(kRequestSuccess, results as AnyObject)
                }catch {
                    completionHandler(kRequestFailed, results as  AnyObject)
                }
            }
        }
        task?.resume()
        
    }

    //  Get Users
    func getUserAlbums(completionHandler : @escaping CompletionHandler)   {
        let urlStr = kHostUrl.addingPercentEncoding(withAllowedCharacters:
            NSCharacterSet.urlQueryAllowed)!+KGetUser+"/\(selectedUser)"+KGetAlbums
        let url = URL(string: urlStr)
        
        // Création du dictionnaire  VT
        var results  =  Array<Albums>()
        let task = self.session?.dataTask(with: url!) { (data, response, error) in
            if let error = error as NSError? {
                
                if error.code == NSURLErrorTimedOut {
                } else {
                    completionHandler(kRequestTimeout, results as AnyObject)
                }
            }else {
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: [])as? [[String: AnyObject]]
                    results = Mapper<Albums>().mapArray(JSONObject: json)!
                    //                    print(results)
                    //                    print(json)
                    completionHandler(kRequestSuccess, results as AnyObject)
                }catch {
                    completionHandler(kRequestFailed, results as  AnyObject)
                }
            }
        }
        task?.resume()
        
    }

    
    //  Get Users
    func getPost(completionHandler : @escaping CompletionHandler)   {
        let urlStr = kHostUrl.addingPercentEncoding(withAllowedCharacters:
            NSCharacterSet.urlQueryAllowed)!+KGetPost
        let url = URL(string: urlStr)
        
        // Création du dictionnaire  VT
        var results  =  Array<Posts>()
        let task = self.session?.dataTask(with: url!) { (data, response, error) in
            if let error = error as NSError? {
                
                if error.code == NSURLErrorTimedOut {
                } else {
                    completionHandler(kRequestTimeout, results as AnyObject)
                }
            }else {
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: [])as? [[String: AnyObject]]
                    results = Mapper<Posts>().mapArray(JSONObject: json)!
                    //                    print(results)
                    //                    print(json)
                    completionHandler(kRequestSuccess, results as AnyObject)
                }catch {
                    completionHandler(kRequestFailed, results as  AnyObject)
                }
            }
        }
        task?.resume()
        
    }
    
    
    //  Get Users
    func getUserPost(completionHandler : @escaping CompletionHandler)   {
        let urlStr = kHostUrl.addingPercentEncoding(withAllowedCharacters:
            NSCharacterSet.urlQueryAllowed)!+KGetUser+"/\(selectedUser)"+KGetPost
        let url = URL(string: urlStr)
        
        // Création du dictionnaire  VT
        var results  =  Array<Posts>()
        let task = self.session?.dataTask(with: url!) { (data, response, error) in
            if let error = error as NSError? {
                
                if error.code == NSURLErrorTimedOut {
                } else {
                    completionHandler(kRequestTimeout, results as AnyObject)
                }
            }else {
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: [])as? [[String: AnyObject]]
                    results = Mapper<Posts>().mapArray(JSONObject: json)!
                    //                    print(results)
                    //                    print(json)
                    completionHandler(kRequestSuccess, results as AnyObject)
                }catch {
                    completionHandler(kRequestFailed, results as  AnyObject)
                }
            }
        }
        task?.resume()
        
    }


    
    
    //  Get 
    func getPhotos(completionHandler : @escaping CompletionHandler)   {
        let urlStr = kHostUrl.addingPercentEncoding(withAllowedCharacters:
            NSCharacterSet.urlQueryAllowed)!+KGetAlbums+"/\(selectedUser)"+KGetPhotos
        let url = URL(string: urlStr)
        
        var results  =  Array<Photos>()
        let task = self.session?.dataTask(with: url!) { (data, response, error) in
            if let error = error as NSError? {
                
                if error.code == NSURLErrorTimedOut {
                } else {
                    completionHandler(kRequestTimeout, results as AnyObject)
                }
            }else {
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: [])as? [[String: AnyObject]]
                    results = Mapper<Photos>().mapArray(JSONObject: json)!
                    //                    print(results)
                    //                    print(json)
                    completionHandler(kRequestSuccess, results as AnyObject)
                }catch {
                    completionHandler(kRequestFailed, results as  AnyObject)
                }
            }
        }
        task?.resume()
        
    }

    
    
    
    
    
}


extension UIImageView {
    
    func downloardImageFromUrl(from url : String)  {
        
        
        let config = URLSessionConfiguration.default // Session Configuration
        let session = URLSession(configuration: config) // Load configuration into Session
        let url = URL(string: url)!
        
        let task = session.dataTask(with: url, completionHandler: {
            (data, response, error) in
            
            if error != nil {
                
                print(error!.localizedDescription)
                
            } else {
                
                do {
                    
                    DispatchQueue.main.async {
                        self.image = UIImage(data : data!)
                    }
                    
                } catch {
                    
                    print("error in downloard image  from json")
                }
            }
            
        })
        task.resume()
        
        
    }
    
}

