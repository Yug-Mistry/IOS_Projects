//
//  AppDelegate.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 11/04/24.
//

import UIKit
import SideMenu

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        setUpInitialVC()
        setUpLeftMenu()
        
        return true
    }
    
    func setUpInitialVC(){
        var story:UIStoryboard!
        var vc:UIViewController!
        if UserDefaults.standard.bool(forKey: "RememberMe"){
            story = UIStoryboard(name: "SideMenuDemo", bundle: nil)
            vc = story.instantiateViewController(withIdentifier: "SideMenuDemoVC")as! SideMenuDemoVC
        }
        else{
            story = UIStoryboard(name: "Login", bundle: nil)
            vc = story.instantiateViewController(withIdentifier: "LoginVC")as! LoginVC
        }
        
        let navcon = UINavigationController(rootViewController: vc)
        navcon.navigationBar.isHidden = true
        window?.rootViewController = navcon
        window?.makeKeyAndVisible()
    }
    
    
    private func setUpLeftMenu() {
        let storyboard = UIStoryboard(name:"SideMenu", bundle: nil)
        let aSideMenuViewController = storyboard.instantiateViewController(withIdentifier: "SideMenuVC")as! SideMenuVC
        
        let sideMenuViewController = SideMenuNavigationController(rootViewController: aSideMenuViewController)
        sideMenuViewController.leftSide = true
        sideMenuViewController.isNavigationBarHidden = true
        SideMenuManager.default.leftMenuNavigationController = sideMenuViewController
        SideMenuManager.default.rightMenuNavigationController = sideMenuViewController
        sideMenuViewController.pushStyle = .default
        sideMenuViewController.presentationStyle = .menuSlideIn
        sideMenuViewController.presentationStyle.backgroundColor = .clear
        sideMenuViewController.settings.statusBarEndAlpha = 0
        sideMenuViewController.presentationStyle.presentingEndAlpha = 0.6
        let  SCREEN_WIDTH = UIScreen.main.bounds.size.width
        sideMenuViewController.menuWidth = SCREEN_WIDTH * 0.8
    }
    
    
}

