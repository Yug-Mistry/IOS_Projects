//
//  StudentDetailsVC.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 29/04/24.
//

import UIKit

/// UIViewController subclass for displaying detailed student information
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
    
    /// Instance of StudentWebService to fetch student data from a web service
    var webService = StudentWebService()
    /// Instance of StudentDetailsDataSourceDelegate to manage table view data source and delegate
    var studentDetailsDataSourceDelegate: StudentDetailsDataSourceDelegate!
    /// The selected student data
    var selectedStudent: StudentModel!
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        // Configure UI elements
        ProfileVW.layer.cornerRadius = ProfileVW.frame.width / 2
        ProfileVW.layer.borderColor = UIColor.systemPink.cgColor
        ProfileVW.layer.borderWidth = 1
        
        ContentVW.layer.cornerRadius = 10
        ContentVW.layer.shadowColor = UIColor.black.cgColor
        ContentVW.layer.shadowOffset = CGSize(width: 0, height: 0)
        ContentVW.layer.shadowRadius = 8.0
        ContentVW.layer.shadowOpacity = 0.8
        ContentVW.layer.masksToBounds = false
        
        HighlightVW.layer.cornerRadius = 10
        
        // Add observer for changes to table view contentSize
        tblVW.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
    }
    
    // MARK: - Observer Method
    
    /// Observes changes to the contentSize property of the table view
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "contentSize" {
            if let newSize = change?[.newKey] as? CGSize {
                // Update the height constraint of the table view
                tblViewHeight.constant = newSize.height
            }
        }
    }
    
    /// Sets up the initial view with student data
    func setupView() {
        lblName.text = selectedStudent.name
        lblInitial.text = selectedStudent.name.first?.uppercased()
        lblDepartment.text = selectedStudent.department
        lblStudentId.text = selectedStudent.studentId
        lblSportsName.text = selectedStudent.sportsName
        setupTableView()
    }
    
    // MARK: - Table View Setup
    
    /// Sets up the table view with necessary configurations
    func setupTableView() {
        if studentDetailsDataSourceDelegate == nil {
            studentDetailsDataSourceDelegate = .init(selectedStudent: selectedStudent, delegate: self, tbl: tblVW)
        }
    }
    
    // MARK: - Actions
    
    /// Action method to navigate back to the previous view controller
    @IBAction func btnBackAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}

// MARK: - TblViewDelegate Extension

extension StudentDetailsVC: TblViewDelegate {
    /// Called when a row is selected in the table view
    func didselect(_ tbl: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Handle row selection here
    }
}
