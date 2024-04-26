//
//  UserDataSourceDelegate.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 17/04/24.
//

import Foundation
import UIKit

// Class responsible for managing table view data source and delegate for UserModel data
class UserDataSourceDelegate: NSObject {
    
    // MARK: - Type Aliases
    
    /// Alias for UserModel
    typealias T = UserModel
    /// Alias for UITableView
    typealias tbl = UITableView
    /// Alias for TblViewDelegate
    typealias del = TblViewDelegate
    
    // MARK: - Properties
    
    /// Array containing data source for table view
    internal var arrSource: [T]
    /// Table view instance
    internal var tblvw: tbl
    /// Delegate for table view events
    internal var delegate: del
    
    // MARK: - Initializers
    
    /// Initializes UserDataSourceDelegate with data source, delegate, and table view
    /// - Parameters:
    ///   - arrData: Data source for the table view
    ///   - delegate: Delegate for table view events
    ///   - tbl: Table view instance
    required init(arrData: [T], delegate: del, tbl: tbl) {
        arrSource = arrData
        tblvw = tbl
        self.delegate = delegate
        super.init()
        setupTbl()
    }
    
    // MARK: - Table View Setup
    
    /// Setup table view with necessary configurations
    fileprivate func setupTbl() {
        let nib = UINib(nibName: "JsonCellTVC", bundle: nil)
        tblvw.register(nib, forCellReuseIdentifier: "JsonCellTVC")
        tblvw.dataSource = self
        tblvw.delegate = self
        tblvw.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tblvw.reloadData()
    }
    
    // MARK: - Data Reload
    
    /// Reload table view data with updated data source
    /// - Parameter arr: Updated data source for the table view
    func reload(arr: [T]) {
        arrSource = arr
        tblvw.reloadData()
    }
}

// MARK: - UITableViewDelegate

extension UserDataSourceDelegate: UITableViewDelegate {
    
    // Method called when a row is selected in the table view
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate.didselect(tblvw, didSelectRowAt: indexPath)
    }
}

// MARK: - UITableViewDataSource

extension UserDataSourceDelegate: UITableViewDataSource {
    
    // Number of rows in the table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrSource.count
    }
    
    // Configures and returns a table view cell for the specified row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblvw.dequeueReusableCell(withIdentifier: "JsonCellTVC", for: indexPath) as! JsonCellTVC
        cell.configCell(data: arrSource[indexPath.row])
        return cell
    }
}
