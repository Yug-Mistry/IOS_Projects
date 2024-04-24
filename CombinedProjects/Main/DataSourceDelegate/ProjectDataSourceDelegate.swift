//
//  ProjectDataSourceDelegate.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 22/04/24.
//

import Foundation
import UIKit

class ProjectDataSourceDelegate: NSObject {
    
    typealias T = ProjectModel
    typealias tbl = UITableView
    typealias del = TblViewDelegate
    
    internal var arrSource: [T]
    internal var tblvw: tbl
    internal var delegate: del
    
    
    //MARK:- Initializers
    required init(arrData: [T], delegate: del, tbl: tbl) {
        arrSource = arrData
        tblvw = tbl
        self.delegate = delegate
        super.init()
        setupTbl()
    }
    
    fileprivate func setupTbl(){
        let nib = UINib(nibName: "ProjectNameTVC", bundle: nil)
        tblvw.register(nib, forCellReuseIdentifier: "ProjectNameTVC")
        tblvw.dataSource = self
        tblvw.delegate = self
        self.tblvw.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tblvw.reloadData()
        
    }
    
    func reload(arr:[T]){
        arrSource = arr
        tblvw.reloadData()
    }
    
    
}

extension ProjectDataSourceDelegate:UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate.didselect(tblvw, didSelectRowAt: indexPath)
    }
}

extension ProjectDataSourceDelegate:UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblvw.dequeueReusableCell(withIdentifier: "ProjectNameTVC", for: indexPath)as! ProjectNameTVC
        cell.configCell(data: arrSource[indexPath.row])
        return cell
    }
}
