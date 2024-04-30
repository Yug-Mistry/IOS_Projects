//
//  ToDoDataSourceDelegate.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 22/04/24.
//

import Foundation
import UIKit

/// Class responsible for managing table view data source and delegate for ToDoListModel data.
class ToDoDataSourceDelegate: NSObject {
    
    // MARK: - Type Aliases
    
    /// Alias for ToDoListModel
    typealias T = ToDoListModel
    /// Alias for UITableView
    typealias tbl = UITableView
    /// Alias for TblViewDelegate
    typealias del = TblViewDelegate
    
    // MARK: - Properties
    
    /// Array containing data source for the table view.
    internal var arrSource: [T]
    /// Table view instance.
    internal var tblvw: tbl
    /// Delegate for table view events.
    internal var delegate: del
    
    /// Title being edited in a text field.
    var editingTitle: String?
    /// Index of the item to be deleted.
    var deletingIndex = 1
    
    // MARK: - Initializers
    
    /// Initializes a ToDoDataSourceDelegate object with the provided data, delegate, and table view.
    /// - Parameters:
    ///   - arrData: The array of ToDoListModel objects to be displayed.
    ///   - delegate: The delegate conforming to TblViewDelegate protocol.
    ///   - tbl: The table view to be managed.
    required init(arrData: [T], delegate: del, tbl: tbl) {
        arrSource = arrData
        tblvw = tbl
        self.delegate = delegate
        super.init()
        setupTbl()
    }
    
    // MARK: - Table View Setup
    
    fileprivate func setupTbl() {
        let nib = UINib(nibName: "ToDoListTVC", bundle: nil)
        tblvw.register(nib, forCellReuseIdentifier: "ToDoListTVC")
        tblvw.dataSource = self
        tblvw.delegate = self
        self.tblvw.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tblvw.reloadData()
    }
    
    // MARK: - Data Reload
    
    /// Reload table view data with updated data source.
    func reload(arr: [T]) {
        arrSource = arr
        tblvw.reloadData()
    }
}

// MARK: - UITableViewDelegate

extension ToDoDataSourceDelegate:UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Handle table view row selection
    }
}

// MARK: - UITableViewDataSource

extension ToDoDataSourceDelegate:UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblvw.dequeueReusableCell(withIdentifier: "ToDoListTVC", for: indexPath) as! ToDoListTVC
        cell.txtContent.delegate = self
        cell.btnDelete.tag = indexPath.row
        cell.btnAdd.addTarget(self, action: #selector(addAction(_:)), for: .touchUpInside)
        cell.btnDelete.addTarget(self, action: #selector(deleteAction(_:)), for: .touchUpInside)
        
        cell.configCell(data: arrSource[indexPath.row])
        return cell
    }
}

// MARK: - ToDoDataSourceDelegate Extension

extension ToDoDataSourceDelegate {
    
    // MARK: - Action Methods
    
    /// Action method triggered when the add button is tapped.
    /// - Parameter sender: The UIButton triggering the action.
    @objc func addAction(_ sender: UIButton){
        // Logic for adding a new item
    }
    
    /// Action method triggered when the delete button is tapped.
    /// - Parameter sender: The UIButton triggering the action.
    @objc func deleteAction(_ sender: UIButton){
        // Logic for deleting an item
    }
}

// MARK: - UITextFieldDelegate Extension

extension ToDoDataSourceDelegate: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.addTarget(self, action: #selector(valueChanged), for: .editingChanged)
    }
    
    /// Action method triggered when the value of the text field changes.
    /// - Parameter textField: The UITextField whose value is changed.
    @objc func valueChanged(_ textField: UITextField){
        editingTitle = textField.text
    }
}
