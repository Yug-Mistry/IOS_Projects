//
//  jsonTVVC.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 17/04/24.
//

import UIKit

class JsonVC: UIViewController {
    
    @IBOutlet weak var tblView: UITableView!
    
    var webService = UserWebService()
    var userDataSourceDelegate : UserDataSourceDelegate!
    @IBOutlet weak var btnBack: UIButton!
    var arrData : [UserModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        // Do any additional setup after loading the view.
    }
    
    func getData(){
        webService.getUserList { arr in
            self.arrData = arr
        }
        setupTblView()
    }

    func setupTblView(){
        if userDataSourceDelegate == nil {
            userDataSourceDelegate = .init(arrData: arrData, delegate: self, tbl: tblView)
        }
    }
    
    @IBAction func btnBackAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}

extension JsonVC: TblViewDelegate {
    func didselect(_ tbl: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
}

