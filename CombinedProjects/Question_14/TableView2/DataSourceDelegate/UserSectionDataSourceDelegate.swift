//
//  UserSectionDataSourceDelegate.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 17/04/24.
//

import Foundation
import UIKit

/// Class responsible for managing table view data source and delegate for grouped UserModel data.
class UserSectionDataSourceDelegate: NSObject {
    
    // MARK: - Type Aliases
    
    typealias T = UserSectionModel
    typealias tbl = UITableView
    typealias del = TblViewDelegate
    
    // MARK: - Properties
    
    /// Dictionary containing grouped data source for table view.
    internal var groupedData: [String: [T]]
    /// Table view instance.
    internal var tblvw: tbl
    /// Delegate for table view events.
    internal var delegate: del
    
    // MARK: - Initializers
    
    /// Initializes UserSectionDataSourceDelegate with grouped data, delegate, and table view.
    ///
    /// - Parameters:
    ///   - groupedData: Grouped data source for table view.
    ///   - delegate: Delegate for table view events.
    ///   - tbl: Table view instance.
    required init(groupedData: [String: [UserSectionModel]], delegate: del, tbl: tbl) {
        self.groupedData = groupedData
        tblvw = tbl
        self.delegate = delegate
        super.init()
        setupTbl()
    }
    
    // MARK: - Table View Setup
    
    /// Sets up the table view with necessary configurations.
    fileprivate func setupTbl() {
        let nib = UINib(nibName: "JsonSectionCellTVC", bundle: nil)
        tblvw.register(nib, forCellReuseIdentifier: "JsonSectionCellTVC")
        tblvw.dataSource = self
        tblvw.delegate = self
        tblvw.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tblvw.reloadData()
    }
    
    // MARK: - Data Reload
    
    /// Reloads table view data with updated grouped data source.
    ///
    /// - Parameter groupedData: Updated grouped data source for table view.
    func reload(groupedData: [String: [UserSectionModel]]) {
        self.groupedData = groupedData
        tblvw.reloadData()
    }
}

// MARK: - UITableViewDelegate

extension UserSectionDataSourceDelegate: UITableViewDelegate {
    
    /// Method called when a row is selected in the table view.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate.didselect(tblvw, didSelectRowAt: indexPath)
    }
}

// MARK: - UITableViewDataSource

extension UserSectionDataSourceDelegate: UITableViewDataSource {
    
    /// Sorted section keys of the grouped data.
    var sortedSectionKeys: [String] {
        return Array(groupedData.keys).sorted()
    }
    
    /// Sorted section data of the grouped data.
    var sortedSectionData: [[UserSectionModel]] {
        return sortedSectionKeys.map { groupedData[$0]! }
    }
    
    /// Number of sections in the table view.
    func numberOfSections(in tableView: UITableView) -> Int {
        return sortedSectionKeys.count
    }
    
    /// Number of rows in the specified section of the table view.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortedSectionData[section].count
    }
    
    /// Configures and returns a table view cell for the specified row and section.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblvw.dequeueReusableCell(withIdentifier: "JsonSectionCellTVC", for: indexPath) as! JsonSectionCellTVC
        cell.configCell(data: sortedSectionData[indexPath.section][indexPath.row])
        return cell
    }
    
    /// Title for the header in the specified section of the table view.
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sortedSectionKeys[section]
    }
}
