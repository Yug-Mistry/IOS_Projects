//
//  UserSectionDataSourceDelegate.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 17/04/24.
//
import Foundation
import UIKit

class UserSectionDataSourceDelegate: NSObject {
    
    typealias T = UserSectionModel
    typealias tbl = UITableView
    typealias del = TblViewDelegate
    
    internal var groupedData: [String: [T]]
    internal var tblvw: tbl
    internal var delegate: del
    
    // MARK: - Initializers
    
    required init(groupedData: [String: [UserSectionModel]], delegate: del, tbl: tbl) {
        self.groupedData = groupedData
        tblvw = tbl
        self.delegate = delegate
        super.init()
        setupTbl()
    }
    
    fileprivate func setupTbl() {
        let nib = UINib(nibName: "JsonSectionCellTVC", bundle: nil)
        tblvw.register(nib, forCellReuseIdentifier: "JsonSectionCellTVC")
        tblvw.dataSource = self
        tblvw.delegate = self
        tblvw.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tblvw.reloadData()
    }
    
    func reload(groupedData: [String: [UserSectionModel]]) {
        self.groupedData = groupedData
        tblvw.reloadData()
    }
}

extension UserSectionDataSourceDelegate: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate.didselect(tblvw, didSelectRowAt: indexPath)
    }
}

extension UserSectionDataSourceDelegate: UITableViewDataSource {
    
    var sortedSectionKeys: [String] {
        return Array(groupedData.keys).sorted()
    }
    
    var sortedSectionData: [[UserSectionModel]] {
        return sortedSectionKeys.map { groupedData[$0]! }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sortedSectionKeys.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortedSectionData[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblvw.dequeueReusableCell(withIdentifier: "JsonSectionCellTVC", for: indexPath) as! JsonSectionCellTVC
        cell.configCell(data: sortedSectionData[indexPath.section][indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sortedSectionKeys[section]
    }
}


