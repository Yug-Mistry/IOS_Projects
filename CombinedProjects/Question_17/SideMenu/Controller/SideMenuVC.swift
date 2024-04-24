//
//  SideMenuVC.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 23/04/24.
//

import UIKit

class SideMenuVC: UIViewController {
    
    @IBOutlet weak var tblView: UITableView!
    
    var arrSideMenu : [SideMenuItemModel] = []
    var sideMenuItemDemoWebService = SideMenuItemDemoWebService()
    var sideMenuDataSourceDelegate : SideMenuDataSourceDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getData()
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

}
extension SideMenuVC : TblViewDelegate {
    func didselect(_ tbl: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sideMenuItem = arrSideMenu[indexPath.row]
        let story = UIStoryboard(name: sideMenuItem.storyboardID , bundle: nil)
        let vc = story.instantiateViewController(withIdentifier: sideMenuItem.viewControllerName )
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
