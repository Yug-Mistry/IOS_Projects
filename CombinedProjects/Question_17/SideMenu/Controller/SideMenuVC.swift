//
//  SideMenuVC.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 23/04/24.
//

import UIKit

class SideMenuVC: UIViewController {
    
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var tblViewHeight: NSLayoutConstraint!
    @IBOutlet weak var btnBottom: UIButton!
    @IBOutlet weak var btnToggleSignIn: UIButton!
    
    var arrSideMenu : [SideMenuItemModel] = []
    var sideMenuItemDemoWebService = SideMenuItemDemoWebService()
    var sideMenuDataSourceDelegate : SideMenuDataSourceDelegate!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblView.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
        
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
        
        getData()
    }
    
    @IBAction func btnToggleSignIn(_ sender: UIButton) {
        let story = UIStoryboard(name: "Login", bundle: nil)
        let vc = story.instantiateViewController(withIdentifier: "LoginVC")as! LoginVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func getData(){
        sideMenuItemDemoWebService.getItemList{ arr in
            self.arrSideMenu = arr
        }
        setUpTblView()
    }
    
    func setUpTblView(){
        if sideMenuDataSourceDelegate == nil {
            sideMenuDataSourceDelegate = .init(arr: arrSideMenu, tblv: tblView, del: self)
        }
    }
    
    // Observe changes to the contentSize property
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "contentSize" {
            if let newSize = change?[.newKey] as? CGSize {
                // Update the height constraint of the table view
                tblViewHeight.constant = newSize.height
            }
        }
    }
    
}
extension SideMenuVC : TblViewDelegate {
    func didselect(_ tbl: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sideMenuItem = arrSideMenu[indexPath.row]
        let story = UIStoryboard(name: sideMenuItem.storyboardID , bundle: nil)
        let vc = story.instantiateViewController(withIdentifier: sideMenuItem.viewControllerName )
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
