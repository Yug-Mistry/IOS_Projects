//
//  SideMenuDataSourceDelegate.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 23/04/24.
//

import UIKit

/// Class responsible for managing the data source and delegate for the side menu table view.
class SideMenuDataSourceDelegate: NSObject {
    
    // MARK: - Type Aliases
    
    typealias tblview = UITableView
    typealias delegate = TblViewDelegate
    
    // MARK: - Properties
    
    /// Array containing the side menu items.
    var arr: [SideMenuItemModel]
    /// Table view instance.
    var tblv: tblview
    /// Delegate for table view events.
    var del: delegate
    /// Currently selected section index path.
    fileprivate var selectedSection: IndexPath?
    
    // MARK: - Initializer
    
    /// Initializes the SideMenuDataSourceDelegate with the provided data, table view, and delegate.
    /// - Parameters:
    ///   - arr: Array containing the side menu items.
    ///   - tblv: Table view instance.
    ///   - del: Delegate for table view events.
    init(arr: [SideMenuItemModel], tblv: tblview, del: delegate) {
        self.arr = arr
        self.tblv = tblv
        self.del = del
        super.init()
        setupTableView()
    }
    
    // MARK: - Methods
    
    /// Reloads the table view with updated data.
    /// - Parameters:
    ///   - arr: Updated array containing the side menu items.
    ///   - selectedSection: Index path of the currently selected section.
    func reload(arr: [SideMenuItemModel], selectedSection: IndexPath) {
        self.arr = arr
        self.selectedSection = selectedSection
        tblv.reloadData()
    }
    
    // MARK: - Private Methods
    
    /// Sets up the table view.
    private func setupTableView() {
        let nib = UINib(nibName: "SideMenuItemTVC", bundle: nil)
        tblv.register(nib, forCellReuseIdentifier: "SideMenuItemTVC")
        tblv.delegate = self
        tblv.dataSource = self
    }
}

// MARK: - UITableViewDelegate

extension SideMenuDataSourceDelegate: UITableViewDelegate {
    
    /// Handles selection of a row in the table view.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        del.didselect(tblv, didSelectRowAt: indexPath)
    }
}

// MARK: - UITableViewDataSource

extension SideMenuDataSourceDelegate: UITableViewDataSource {
    
    /// Returns the number of rows in the table view.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    /// Configures and returns a table view cell for the specified row.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let aMenuOptionData = arr[indexPath.row]
        let aMenuItemCell = tableView.dequeueReusableCell(withIdentifier: "SideMenuItemTVC", for: indexPath) as! SideMenuItemTVC
        aMenuItemCell.configCell(data: aMenuOptionData)
        
        // Hide separator for the last row
        if arr.count - 1 == indexPath.row {
            aMenuItemCell.seperatorVW.isHidden = true
        }
        
        return aMenuItemCell
    }
}
