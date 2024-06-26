//
//  SideMenuDemoVC.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 23/04/24.
//

import UIKit
import SideMenu

/// View controller for demonstrating the side menu functionality.
class SideMenuDemoVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    /// Action triggered when the side menu button is tapped.
    /// - Parameter sender: The button that triggered the action.
    @IBAction func btnShowSideMenuAction(_ sender: UIButton) {
        if let menuLeftNavigationController = SideMenuManager.default.leftMenuNavigationController {
            if menuLeftNavigationController.presentingViewController != nil {
                menuLeftNavigationController.dismiss(animated: false) {
                    self.present(menuLeftNavigationController, animated: true, completion: nil)
                }
            } else {
                self.present(menuLeftNavigationController, animated: true, completion: nil)
            }
        }
    }

}
