//
//  StudentsVC.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 29/04/24.
//

import UIKit

class StudentTableViewVC: UIViewController {
    
    // MARK: -Outlets
    
    @IBOutlet weak var tblVW: UITableView!
    
    // MARK: - Properties
    
    /// Instance of StudentWebService to fetch user data from a web service
    var webService = StudentWebService()
    /// Instance of StudentDataSourceDelegate to manage table view data source and delegate
    var studentDataSourceDelegate: StudentDataSourceDelegate!
    /// Array to store user data fetched from the web service
    var arrData: [StudentModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Data Fetching
    
    /// Method to fetch user data from the web service
    func getData() {
        webService.getStudentList { arr in
            self.arrData = arr
        }
        setupTblView()
    }
    
    // MARK: - Table View Setup
    
    /// Method to setup table view with necessary configurations
    func setupTblView() {
        if studentDataSourceDelegate == nil {
            studentDataSourceDelegate = .init(arrData: arrData, delegate: self, tbl: tblVW)
        }
    }
    
    @IBAction func btnBackAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}

extension StudentTableViewVC: TblViewDelegate{
    /// Method called when a row is selected in the table view
    func didselect(_ tbl: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "StudentDetails", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "StudentDetailsVC") as! StudentDetailsVC
        viewController.selectedStudent = arrData[indexPath.row]
        navigationController?.pushViewController(viewController, animated: true)
    }
}
