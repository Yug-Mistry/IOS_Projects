//
//  SampleDataSourceDelegate.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 16/04/24.
//

import Foundation
import UIKit

// Protocol for table view delegate
protocol TblViewDelegate {
    func didselect(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
}

// Class responsible for managing table view data source and delegate
class SampleDataSourceDelegate: NSObject {
    
    // MARK: - Properties
    
    /// Dictionary containing data source for table view
    internal var arrSource: [String: [String]]
    /// Table view instance
    internal var tblvw: UITableView
    /// Delegate for table view events
    internal var delegate: TblViewDelegate
    
    // MARK: - Initializers
    
    /// Initializes SampleDataSourceDelegate with data source, delegate, and table view
    /// - Parameters:
    ///   - arrData: Data source for the table view
    ///   - delegate: Delegate for table view events
    ///   - tbl: Table view instance
    required init(arrData: [String: [String]], delegate: TblViewDelegate, tbl: UITableView) {
        arrSource = arrData
        tblvw = tbl
        self.delegate = delegate
        super.init()
        setupTbl()
    }
    
    // MARK: - Table View Setup
    
    /// Sets up table view with necessary configurations
    fileprivate func setupTbl() {
        let nib = UINib(nibName: "CellTVC", bundle: nil)
        tblvw.register(nib, forCellReuseIdentifier: "CellTVC")
        tblvw.dataSource = self
        tblvw.delegate = self
        tblvw.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tblvw.reloadData()
    }
    
    // MARK: - Data Reload
    
    /// Reloads table view data with updated data source
    /// - Parameter arr: Updated data source for the table view
    func reload(arr: [String: [String]]) {
        arrSource = arr
        tblvw.reloadData()
    }
}

// MARK: - UITableViewDataSource & UITableViewDelegate

extension SampleDataSourceDelegate: UITableViewDataSource, UITableViewDelegate {
    
    // Method called when a row is selected in the table view
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate.didselect(tblvw, didSelectRowAt: indexPath)
    }
    
    // Number of rows in the table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Array(arrSource.values)[section].count
    }
    
    // Configures and returns a table view cell for the specified row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellTVC", for: indexPath) as! CellTVC
        cell.configCell(data: Array(arrSource.values)[indexPath.row])
        return cell
    }
    
    // Allows editing of rows in the table view
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // Handles editing style for rows in the table view
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .insert {
            // Handle insertion action
        }
    }
}
