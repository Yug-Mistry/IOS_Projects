//
//  SideMenuVC.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 23/04/24.
//

import UIKit

/// View controller for the side menu.
class SideMenuVC: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var tblViewHeight: NSLayoutConstraint!
    @IBOutlet weak var btnBottom: UIButton!
    @IBOutlet weak var btnToggleSignIn: UIButton!
    
    // MARK: - Properties
    
    var arrSideMenu : [SideMenuItemModel] = []
    var sideMenuItemDemoWebService = SideMenuItemDemoWebService()
    var sideMenuDataSourceDelegate : SideMenuDataSourceDelegate!
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add observer for content size changes of the table view
        tblView.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
        
        // Set up UI based on user login status
        setupUserInterface()
        
        // Fetch data for side menu
        getData()
    }
    
    // MARK: - UI Setup
    
    /// Sets up the UI based on user login status.
    private func setupUserInterface() {
        if UserDefaults.standard.bool(forKey: "RememberMe"){
            btnToggleSignIn.setTitle("Logout", for: .normal)
            btnBottom.setTitle("  Logout", for: .normal)
            btnBottom.setImage(UIImage(named: "log_out"), for: .normal)
        }
        else{
            btnToggleSignIn.setTitle("Login", for: .normal)
            btnBottom.setTitle("  Login", for: .normal)
            btnBottom.setImage(UIImage(named: "log_in"), for: .normal)
        }
    }
    
    // MARK: - Data Fetching
    
    /// Fetches data for the side menu.
    private func getData() {
        sideMenuItemDemoWebService.getItemList { arr in
            self.arrSideMenu = arr
        }
        setUpTableView()
    }
    
    // MARK: - Table View Setup
    
    /// Sets up the table view.
    private func setUpTableView() {
        if sideMenuDataSourceDelegate == nil {
            sideMenuDataSourceDelegate = .init(arr: arrSideMenu, tblv: tblView, del: self)
        }
    }
    
    // MARK: - Observer Method
    
    // Observe changes to the contentSize property
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "contentSize" {
            if let newSize = change?[.newKey] as? CGSize {
                // Update the height constraint of the table view
                tblViewHeight.constant = newSize.height
            }
        }
    }
    
    // MARK: - Button Actions
    
    @IBAction func btnToggleSignIn(_ sender: UIButton) {
        let story = UIStoryboard(name: "Login", bundle: nil)
        let vc = story.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

// MARK: - Table View Delegate

extension SideMenuVC : TblViewDelegate {
    
    /// Handles selection of a row in the table view.
    func didselect(_ tbl: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sideMenuItem = arrSideMenu[indexPath.row]
        let story = UIStoryboard(name: sideMenuItem.storyboardID , bundle: nil)
        let vc = story.instantiateViewController(withIdentifier: sideMenuItem.viewControllerName )
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
