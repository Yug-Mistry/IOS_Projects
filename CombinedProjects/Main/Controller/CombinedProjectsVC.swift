//
//  CombinedProjectsVC.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 18/04/24.
//

import UIKit

class CombinedProjectsVC: UIViewController {
    
    var webService = ProjectWebService()
    var userDataSourceDelegate : ProjectDataSourceDelegate!
    var arrData : [ProjectModel] = []

    @IBOutlet weak var tblVW: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    func getData(){
        webService.getProjectList { arr in
            self.arrData = arr
        }
        setupTblView()
    }

    func setupTblView(){
        if userDataSourceDelegate == nil {
            userDataSourceDelegate = .init(arrData: arrData, delegate: self, tbl: tblVW)
        }
    }

}

extension CombinedProjectsVC: TblViewDelegate {
    func didselect(_ tbl: UITableView, didSelectRowAt indexPath: IndexPath) {
        let obj = arrData[indexPath.row]
        let storyboard = UIStoryboard(name: obj.storyboardName, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: obj.viewControllerName)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
