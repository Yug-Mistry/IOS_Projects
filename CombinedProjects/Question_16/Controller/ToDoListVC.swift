//
//  ToDoListVC.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 22/04/24.
//

import UIKit

class ToDoListVC: UIViewController {
    
    @IBOutlet weak var tblVW: UITableView!
    
    // MARK: - Variables
    
    /// Data source delegate for the table view.
    var toDoDataSourceDelegate: ToDoDataSourceDelegate!
    
    // MARK: - Source Data
    
    /// Array containing the source data for the table view.
    var arrSource = [
        ToDoListModel(content: "", isEditing: true)
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTable()
    }
    
    // MARK: - Set Up Table Action
    
    /// Set up the table view.
    func setUpTable(){
        if toDoDataSourceDelegate == nil {
            toDoDataSourceDelegate = .init(arrData: arrSource, delegate: self, tbl: tblVW)
        }
    }
}

// MARK: - TblViewDelegate

extension ToDoListVC: TblViewDelegate{
    
    /// Called when a row is selected in the table view.
    func didselect(_ tbl: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
