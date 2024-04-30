//
//  UserDetailsDataSourceDelegate.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 29/04/24.
//

import Foundation
import UIKit

// Class responsible for managing table view data source and delegate for UserModel data
class StudentDetailsDataSourceDelegate: NSObject {
    
    // MARK: - Type Aliases
    
    /// Alias for StudentModel
    typealias T = StudentModel
    /// Alias for UITableView
    typealias tbl = UITableView
    /// Alias for TblViewDelegate
    typealias del = TblViewDelegate
    
    // MARK: - Properties
    
    /// variable containing selected student data
    internal var selectedStudentDetails: T
    /// Table view instance
    internal var tblvw: tbl
    /// Delegate for table view events
    internal var delegate: del
    
    // Define key-value array for properties
        let properties: [(key: String, title: String)] = [
            ("name", "Name"),
            ("department", "Department"),
            ("studentId", "Student ID"),
            ("sportsName", "Sports Name"),
            ("dob", "Date of Birth"),
            ("gender", "Gender"),
            ("sem1Grade", "Semester 1 Grade"),
            ("sem2Grade", "Semester 2 Grade"),
            ("sem3Grade", "Semester 3 Grade"),
            ("sem4Grade", "Semester 4 Grade"),
            ("sem5Grade", "Semester 5 Grade"),
            ("sem6Grade", "Semester 6 Grade"),
            ("address", "Address"),
            ("phoneNumber", "Phone Number"),
            ("email", "Email"),
            ("guardianName", "Guardian Name"),
            ("guardianPhoneNumber", "Guardian Phone Number"),
            ("emergencyContact", "Emergency Contact"),
            ("bloodGroup", "Blood Group")
        ]
    
    // MARK: - Initializers
    
    /// Initializes StudentDetailsDataSourceDelegate with data source, delegate, and table view
    /// - Parameters:
    ///   - selectedStudent: Selected student data
    ///   - delegate: Delegate for table view events
    ///   - tbl: Table view instance
    required init(selectedStudent: T, delegate: del, tbl: tbl) {
        selectedStudentDetails = selectedStudent
        tblvw = tbl
        self.delegate = delegate
        super.init()
        setupTbl()
    }
    
    // MARK: - Table View Setup
    
    /// Setup table view with necessary configurations
    fileprivate func setupTbl() {
        let nib = UINib(nibName: "StudentDetailsTVC", bundle: nil)
        tblvw.register(nib, forCellReuseIdentifier: "StudentDetailsTVC")
        tblvw.dataSource = self
        tblvw.delegate = self
        tblvw.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tblvw.reloadData()
    }
    
    // MARK: - Data Reload
    
    /// Reload table view data with updated data source
    /// - Parameter arr: Updated data source for the table view
    func reload(details: T) {
        selectedStudentDetails = details
        tblvw.reloadData()
    }
}

// MARK: - UITableViewDelegate

extension StudentDetailsDataSourceDelegate: UITableViewDelegate {
    
    // Method called when a row is selected in the table view
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate.didselect(tblvw, didSelectRowAt: indexPath)
    }
}

// MARK: - UITableViewDataSource

extension StudentDetailsDataSourceDelegate: UITableViewDataSource {
    
    // Number of rows in the table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return properties.count
    }
    
    // Configures and returns a table view cell for the specified row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblvw.dequeueReusableCell(withIdentifier: "StudentDetailsTVC", for: indexPath) as! StudentDetailsTVC
        if properties.count - 1 == indexPath.row{
            cell.sepVW.isHidden = true
        }
        let property = properties[indexPath.row]
        
        let propertyName = property.key
        let propertyTitle = property.title
        let propertyValue = selectedStudentDetails.value(forKey: propertyName) as? String ?? ""
        cell.configCell(key: propertyTitle, value: propertyValue)
        return cell
    }
}
