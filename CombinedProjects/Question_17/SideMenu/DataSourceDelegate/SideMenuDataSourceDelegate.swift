//
//  SideMenuDataSourceDelegate.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 23/04/24.
//

import Foundation

import UIKit
class SideMenuDataSourceDelegate : NSObject {
    
    typealias tblview = UITableView
    typealias delegate = TblViewDelegate
    
    var arr : [SideMenuItemModel]
    var tblv  : tblview
    var del : delegate
    fileprivate var selectedSection: IndexPath?
    var tblViewDataSourceDelegate:SideMenuDataSourceDelegate?
 
    
    init( arr:[SideMenuItemModel],tblv : tblview , del : delegate){
        self.arr = arr
        self.tblv = tblv
        self.del = del
        super.init()
        setupTableView()
    }
    
    func reload(arr : [SideMenuItemModel] , selectedSection : IndexPath) {
        self.arr = arr
        self.selectedSection = selectedSection
        tblv.reloadData()
    }
    
    fileprivate func setupTableView(){
        let nib = UINib(nibName: "SideMenuItemTVC", bundle: nil)
        tblv.register(nib, forCellReuseIdentifier: "SideMenuItemTVC")
        tblv.delegate = self
        tblv.dataSource = self
    }
}

extension SideMenuDataSourceDelegate : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        del.didselect(tblv, didSelectRowAt: indexPath)
    }
}
extension SideMenuDataSourceDelegate :UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let aMenuOptionData = arr[indexPath.row]
        let aMenuItemCell = tableView.dequeueReusableCell(withIdentifier: "SideMenuItemTVC", for: indexPath) as! SideMenuItemTVC
        aMenuItemCell.configCell(data: aMenuOptionData)
        print(arr.count," ",indexPath.row)
        if arr.count-1 == indexPath.row {
            aMenuItemCell.seperatorVW.isHidden = true
        }
        
        return aMenuItemCell
    }
}

