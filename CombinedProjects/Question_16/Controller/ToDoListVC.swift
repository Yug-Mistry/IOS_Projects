//
//  ToDoListVC.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 22/04/24.
//

import UIKit

class ToDoListVC: UIViewController {
    
    @IBOutlet weak var tblVW: UITableView!
    
    //Variables
    var toDoDataSourceDelegate: ToDoDataSourceDelegate!
    
    //Source Data
    var arrSource = [
        ToDoListModel(content: "", isEditing: true)
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTable()
    }
    
    //SetUp Table Action
    func setUpTable(){
        if toDoDataSourceDelegate == nil {
            toDoDataSourceDelegate = .init(arrData: arrSource, delegate: self, tbl: tblVW)
        }
    }
}

extension ToDoListVC: TblViewDelegate{
    func didselect(_ tbl: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
