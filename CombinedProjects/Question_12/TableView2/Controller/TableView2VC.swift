//
//  TableView2VC.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 16/04/24.
//

import UIKit

class TableView2VC: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var btnBack: UIButton!
    
    let arrEmployees = [
        "1" : ["Atharv Pandit","01-01-2000","iOS"],
        "2" : ["Kashyap Patel","01-02-2000","iOS"],
        "3" : ["Panshul Mistry","01-03-2000","iOS"],
        "4" : ["Priyal Savaliya","01-04-2000","Android"]
        ]
    
    var sampleDataSourceDelegate : SampleDataSourceDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTblView()
        // Do any additional setup after loading the view.
    }
    func setupTblView(){
        if sampleDataSourceDelegate == nil {
            sampleDataSourceDelegate = .init(arrData: arrEmployees, delegate: self, tbl: tableview)
        }
    }
    
    @IBAction func btnBackAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}

extension TableView2VC : TblViewDelegate {
    func didselect(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print  (Array(arrEmployees.values)[indexPath.section][indexPath.row])
    }
}
