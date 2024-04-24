//
//  jsonTVVC.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 17/04/24.
//

import UIKit

class JsonSectionVC: UIViewController {
    
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var webService = UserSectionWebService()
    var userSectionDataSourceDelegate : UserSectionDataSourceDelegate!
    var arrData : [UserSectionModel] = []
    var groupedData: [String: [UserSectionModel]] = [:]


    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        searchBar.delegate = self
    }
    
    @IBAction func btnBackAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    func getData(){
        webService.getUserList { arr in
            self.arrData = arr            
            self.groupData()
        }
        setupTblView()
    }
    
    func groupData() {
            groupedData = Dictionary(grouping: arrData) { String($0.fname.prefix(1)).uppercased() }
    }

    func setupTblView(){
        if userSectionDataSourceDelegate == nil {
            userSectionDataSourceDelegate = .init(groupedData: groupedData, delegate: self, tbl: tblView)
        }
    }

}

extension JsonSectionVC: TblViewDelegate {
    func didselect(_ tbl: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension JsonSectionVC: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let trimmedSearchText = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        if !trimmedSearchText.isEmpty {
            var filteredData: [String: [UserSectionModel]] = [:]
            
            for (sectionTitle, contacts) in groupedData {
                let filteredContacts = contacts.filter { $0.fname.lowercased().contains(trimmedSearchText.lowercased()) }
                if !filteredContacts.isEmpty {
                    filteredData[sectionTitle] = filteredContacts
                }
            }   
            userSectionDataSourceDelegate.reload(groupedData: filteredData)
        } else {
            userSectionDataSourceDelegate.reload(groupedData: groupedData)
        }
    }
    
}
