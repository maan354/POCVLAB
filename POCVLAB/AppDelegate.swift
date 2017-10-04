//
//  AppDelegate.swift
//  POCVLAB
//
//  Created by NDIAYE on 02/10/2017.
//  Copyright © 2017 NDIAYE. All rights reserved.
//

import UIKit

func Loc(key:String) ->String{
    return NSLocalizedString(key, comment: "")
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UITabBarControllerDelegate {
    
    var window: UIWindow?
    let tabBarController: UITabBarController = UITabBarController()
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
       
        createTabBarNavigation()
        setupTabbarImages()
        tabBarController.delegate = self
        
        //Definition du tabbar en rootVC pour le rendre visible
        self.window?.rootViewController = self.tabBarController
        return true
    }
    
    
    //Tabbar creation
    func createTabBarNavigation() {
        //Definition des VC a mettre dans la tabbar
        self.tabBarController.viewControllers = self.createMenuControllers()
            as? [UIViewController]
        navBarCustomization()
    }
    
    
    func createMenuControllers() -> NSArray {
        
        //Onglet VirtualStockVC
        let homePageVC: HomePageVC = HomePageVC(nibName: "HomePageVC", bundle: nil)
        let homePageVCwithNav = UINavigationController(rootViewController: homePageVC)
        homePageVCwithNav.navigationBar.isTranslucent = false
        //Onglet StockEvolutionVC
        let albumsVC: AlbumsVC = AlbumsVC(nibName: "AlbumsVC", bundle: nil)
        let albumsVCwithNav = UINavigationController(rootViewController: albumsVC)
        albumsVCwithNav.navigationBar.isTranslucent = false

        let postVC: PostVC = PostVC(nibName: "PostVC", bundle: nil)
        let documentsVCwithNav = UINavigationController(rootViewController: postVC)
        documentsVCwithNav.navigationBar.isTranslucent = false
        
        return [homePageVCwithNav,albumsVCwithNav,documentsVCwithNav]
    }
    
    //Icones de la tabbar
    func setupTabbarImages() {
        
        
        //        self.tabBarController.tabBar.tintColor = UIColor.clear
        self.tabBarController.tabBar.autoresizesSubviews = true
        self.tabBarController.tabBar.clipsToBounds = true
        //Mise en place des icones
        let tabBarItem1 = self.tabBarController.tabBar.items![0] as UITabBarItem
        let tabBarItem2 = self.tabBarController.tabBar.items![1] as UITabBarItem
        let tabBarItem3 = self.tabBarController.tabBar.items![2] as UITabBarItem
 
        
        // On set les images des bouttons de la tab barre
        tabBarItem1.image = UIImage(named: "artisteOff")
        tabBarItem2.image = UIImage(named: "albumOff")
        tabBarItem3.image = UIImage(named: "postOff")

        
        tabBarItem1.selectedImage = UIImage(named: "artisteON")?.withRenderingMode(.alwaysOriginal)
        tabBarItem2.selectedImage = UIImage(named: "albumON")?.withRenderingMode(.alwaysOriginal)
        tabBarItem3.selectedImage = UIImage(named: "postON")?.withRenderingMode(.alwaysOriginal)

    }
    
    func navBarCustomization() {
        //UINavigationBar.appearance().barTintColor = UIColor(hex: "212121")
        UINavigationBar.appearance().tintColor = .black
        // Title's text color
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.black]
        
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
}


