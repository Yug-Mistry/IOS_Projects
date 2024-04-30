//
//  StudentDetailsVC.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 29/04/24.
//

import UIKit

class StudentDetailsVC: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var lblInitial: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDepartment: UILabel!
    @IBOutlet weak var lblStudentId: UILabel!
    @IBOutlet weak var lblSportsName: UILabel!
    @IBOutlet weak var ProfileVW: UIView!
    @IBOutlet weak var ContentVW: UIView!
    @IBOutlet weak var HighlightVW: UIView!
    @IBOutlet weak var tblVW: UITableView!
    @IBOutlet weak var tblViewHeight: NSLayoutConstraint!
    
    // MARK: - Properties
    
    /// Instance of StudentWebService to fetch user data from a web service
    var webService = StudentWebService()
    /// Instance of StudentDataSourceDelegate to manage table view data source and delegate
    var studentDetailsDataSourceDelegate: StudentDetailsDataSourceDelegate!
    /// Variable to store selected student data 
    var selectedStudent: StudentModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        ProfileVW.layer.cornerRadius = ProfileVW.frame.width/2
        ProfileVW.layer.borderColor = UIColor.systemPink.cgColor
        ProfileVW.layer.borderWidth = 1
        
        ContentVW.layer.cornerRadius = 10
        ContentVW.layer.shadowColor = UIColor.black.cgColor
        ContentVW.layer.shadowOffset = CGSize(width: 0,height: 0)
        ContentVW.layer.shadowRadius = 8.0
        ContentVW.layer.shadowOpacity = 0.8
        ContentVW.layer.masksToBounds = false
        
        HighlightVW.layer.cornerRadius = 10
        
        tblVW.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
        
    }
    
    // MARK: - Observer Method
    
    // Observe changes to the contentSize property
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "contentSize" {
            if let newSize = change?[.newKey] as? CGSize {
                // Update the height constraint of the table view
                tblViewHeight.constant = newSize.height
            }
        }
    }
    
    func setupView(){
        lblName.text = selectedStudent.name
        lblInitial.text = selectedStudent.name.first?.uppercased()
        lblDepartment.text = selectedStudent.department
        lblStudentId.text = selectedStudent.studentId
        lblSportsName.text = selectedStudent.sportsName
        setupTblView()
    }
    
    // MARK: - Table View Setup
    
    /// Method to setup table view with necessary configurations
    func setupTblView() {
        if studentDetailsDataSourceDelegate == nil {
            studentDetailsDataSourceDelegate = .init(selectedStudent: selectedStudent, delegate: self, tbl: tblVW)
        }
    }
    
    @IBAction func btnBackAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}

extension StudentDetailsVC: TblViewDelegate{
    /// Method called when a row is selected in the table view
    func didselect(_ tbl: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Code to handle row selection
    }
}
