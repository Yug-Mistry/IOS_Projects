//
//  ToDoDataSourceDelegate.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 22/04/24.
//

import Foundation
import UIKit

class ToDoDataSourceDelegate: NSObject {
    
    typealias T = ToDoListModel
    typealias tbl = UITableView
    typealias del = TblViewDelegate
    
    internal var arrSource: [T]
    internal var tblvw: tbl
    internal var delegate: del
    
    
    var editingTitle: String?
    var deletingIndex = 1
    
    //MARK:- Initializers
    required init(arrData: [T], delegate: del, tbl: tbl) {
        arrSource = arrData
        tblvw = tbl
        self.delegate = delegate
        super.init()
        setupTbl()
    }
    
    fileprivate func setupTbl(){
        let nib = UINib(nibName: "ToDoListTVC", bundle: nil)
        tblvw.register(nib, forCellReuseIdentifier: "ToDoListTVC")
        tblvw.dataSource = self
        tblvw.delegate = self
        self.tblvw.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tblvw.reloadData()
        
    }
    
    func reload(arr:[T ]){
        arrSource = arr
        tblvw.reloadData()
    }
    
    
}

extension ToDoDataSourceDelegate:UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
    
}
extension ToDoDataSourceDelegate:UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tblvw.dequeueReusableCell(withIdentifier: "ToDoListTVC", for: indexPath)as! ToDoListTVC
        cell.txtContent.delegate = self
        cell.btnDelete.tag = indexPath.row
        cell.btnAdd.addTarget(self, action: #selector(addAction(_:)), for: .touchUpInside)
        cell.btnDelete.addTarget(self, action: #selector(deleteAction(_:)), for: .touchUpInside)
        
        cell.configCell(data: arrSource[indexPath.row])
        return cell
    }
}


extension ToDoDataSourceDelegate{
    
    @objc func addAction(_ sender: UIButton){
        print("inside add action")
        
        guard let title = editingTitle, !title.isEmpty else {
            print("Editing title is empty or nil.")
            return
        }
        
        // Calculate the insertion index for the second-to-last position.
        let insertIndex = arrSource.count == 1 ? 0 : (arrSource.count - 1)
        
        // Insert the new item into the data source.
        arrSource.insert(ToDoListModel(content: title, isEditing: false), at: insertIndex)
        editingTitle = ""
        self.reload(arr: arrSource)
        
    }
    
    @objc func deleteAction(_ sender: UIButton){
        print("inside delete action")
        let button = sender
        let index = button.tag
        print(index)
        arrSource.remove(at: index)
        reload(arr: arrSource)
    }
    
}

extension ToDoDataSourceDelegate: UITextFieldDelegate{
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.addTarget(self, action: #selector(valueChanged), for: .editingChanged)
    }
    
    
    @objc func valueChanged(_ textField: UITextField){
        editingTitle = textField.text
    }
    
}
