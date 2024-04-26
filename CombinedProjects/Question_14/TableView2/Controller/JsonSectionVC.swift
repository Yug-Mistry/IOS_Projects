//
//  JsonSectionVC.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 17/04/24.
//

import UIKit

/// View Controller responsible for displaying JSON sectioned data in a table view.
class JsonSectionVC: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    // MARK: - Properties
    
    /// Instance of UserSectionWebService to fetch user sectioned data from a web service.
    var webService = UserSectionWebService()
    
    /// Instance of UserSectionDataSourceDelegate to manage table view data source and delegate.
    var userSectionDataSourceDelegate: UserSectionDataSourceDelegate!
    
    /// Array to store user sectioned data fetched from the web service.
    var arrData: [UserSectionModel] = []
    
    /// Dictionary to store user sectioned data grouped by section.
    var groupedData: [String: [UserSectionModel]] = [:]

    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        searchBar.delegate = self
    }
    
    // MARK: - Button Action
    
    /// Action triggered when the back button is tapped.
    @IBAction func btnBackAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Data Fetching
    
    /// Method to fetch user sectioned data from the web service.
    func getData() {
        webService.getUserList { arr in
            self.arrData = arr
            self.groupData()
        }
        setupTblView()
    }
    
    // MARK: - Data Grouping
    
    /// Method to group user sectioned data by section.
    func groupData() {
        groupedData = Dictionary(grouping: arrData) { String($0.fname.prefix(1)).uppercased() }
    }

    // MARK: - Table View Setup
    
    /// Method to setup table view with necessary configurations.
    func setupTblView() {
        if userSectionDataSourceDelegate == nil {
            userSectionDataSourceDelegate = .init(groupedData: groupedData, delegate: self, tbl: tblView)
        }
    }

}

// MARK: - TblViewDelegate

extension JsonSectionVC: TblViewDelegate {
    
    /// Method called when a row is selected in the table view.
    func didselect(_ tbl: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Code to handle row selection
    }
}

// MARK: - UISearchBarDelegate

extension JsonSectionVC: UISearchBarDelegate {
    
    /// Method called when text in the search bar changes.
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
