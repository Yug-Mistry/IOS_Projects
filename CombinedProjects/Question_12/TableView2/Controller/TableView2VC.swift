//
//  TableView2VC.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 16/04/24.
//

import UIKit

// View Controller responsible for managing a table view displaying employee data
class TableView2VC: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var btnBack: UIButton!
    
    // Dictionary containing employee data
    let arrEmployees = [
        "1" : ["Atharv Pandit", "01-01-2000", "iOS"],
        "2" : ["Kashyap Patel", "01-02-2000", "iOS"],
        "3" : ["Panshul Mistry", "01-03-2000", "iOS"],
        "4" : ["Priyal Savaliya", "01-04-2000", "Android"]
    ]
    
    // Instance of SampleDataSourceDelegate to manage table view data source and delegate
    var sampleDataSourceDelegate: SampleDataSourceDelegate!
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTblView()
        // Additional setup after loading the view
    }
    
    // Method to setup table view
    func setupTblView() {
        if sampleDataSourceDelegate == nil {
            // Initialize SampleDataSourceDelegate with employee data and table view
            sampleDataSourceDelegate = .init(arrData: arrEmployees, delegate: self, tbl: tableview)
        }
    }
    
    // MARK: - Button Action
    
    // Action triggered when the back button is tapped
    @IBAction func btnBackAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - TblViewDelegate

extension TableView2VC: TblViewDelegate {
    
    // Method called when a table view cell is selected
    func didselect(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Print the selected employee data
        print(Array(arrEmployees.values)[indexPath.section][indexPath.row])
    }
}
