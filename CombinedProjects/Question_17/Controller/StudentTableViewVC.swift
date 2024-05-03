//
//  StudentsVC.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 29/04/24.
//

import UIKit

/// UIViewController subclass for displaying a list of students in a table view
class StudentTableViewVC: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var tblVW: UITableView!
    
    // MARK: - Properties
    
    /// Instance of StudentWebService to fetch student data from a web service
    var webService = StudentWebService()
    /// Instance of StudentDataSourceDelegate to manage table view data source and delegate
    var studentDataSourceDelegate: StudentDataSourceDelegate!
    /// Array to store student data fetched from the web service
    var arrData: [StudentModel] = []
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    // MARK: - Data Fetching
    
    /// Fetches student data from the web service
    func getData() {
        webService.getStudentList { arr in
            self.arrData = arr
            self.setupTableView()
        }
    }
    
    // MARK: - Table View Setup
    
    /// Sets up the table view with necessary configurations
    func setupTableView() {
        if studentDataSourceDelegate == nil {
            studentDataSourceDelegate = .init(arrData: arrData, delegate: self, tbl: tblVW)
        }
    }
    
    // MARK: - Actions
    
    /// Action method triggered when the back button is tapped
    @IBAction func btnBackAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}

// MARK: - TblViewDelegate Extension

extension StudentTableViewVC: TblViewDelegate {
    /// Called when a row is selected in the table view
    func didselect(_ tbl: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "StudentDetails", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "StudentDetailsVC") as! StudentDetailsVC
        viewController.selectedStudent = arrData[indexPath.row]
        navigationController?.pushViewController(viewController, animated: true)
    }
}
