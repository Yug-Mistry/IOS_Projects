//
//  JsonVC.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 17/04/24.
//

import UIKit

// View Controller responsible for displaying JSON data in a table view
class JsonVC: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var btnBack: UIButton!
    
    // MARK: - Properties
    
    /// Instance of UserWebService to fetch user data from a web service
    var webService = UserWebService()
    /// Instance of UserDataSourceDelegate to manage table view data source and delegate
    var userDataSourceDelegate: UserDataSourceDelegate!
    /// Array to store user data fetched from the web service
    var arrData: [UserModel] = []

    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        // Additional setup after loading the view
    }
    
    // MARK: - Data Fetching
    
    /// Method to fetch user data from the web service
    func getData() {
        webService.getUserList { arr in
            self.arrData = arr
        }
        setupTblView()
    }

    // MARK: - Table View Setup
    
    /// Method to setup table view with necessary configurations
    func setupTblView() {
        if userDataSourceDelegate == nil {
            userDataSourceDelegate = .init(arrData: arrData, delegate: self, tbl: tblView)
        }
    }
    
    // MARK: - Button Action
    
    /// Action triggered when the back button is tapped
    @IBAction func btnBackAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - TblViewDelegate

extension JsonVC: TblViewDelegate {
    /// Method called when a row is selected in the table view
    func didselect(_ tbl: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Code to handle row selection
    }
}
