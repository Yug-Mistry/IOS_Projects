//
//  NewsDataSourceDelegate.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 01/05/24.
//

import Foundation
import UIKit

/// Class responsible for managing table view data source and delegate for NewsModel data
class NewsDataSourceDelegate: NSObject {
    
    // MARK: - Type Aliases
    
    /// Alias for NewsModel
    typealias T = NewsModel
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
    /// View controller where the table view resides
    internal var viewController: UIViewController
    
    // MARK: - Initializers
    
    /// Initializes NewsDataSourceDelegate with data source, delegate, and table view
    /// - Parameters:
    ///   - arrData: Data source for the table view
    ///   - delegate: Delegate for table view events
    ///   - tbl: Table view instance
    ///   - viewController: View controller where the table view resides
    required init(arrData: [T], delegate: del, tbl: tbl, viewController: UIViewController) {
        arrSource = arrData
        tblvw = tbl
        self.delegate = delegate
        self.viewController = viewController
        super.init()
        setupTbl()
    }
    
    // MARK: - Table View Setup
    
    /// Setup table view with necessary configurations
    fileprivate func setupTbl() {
        let nib = UINib(nibName: "NewsTVC", bundle: nil)
        tblvw.register(nib, forCellReuseIdentifier: "NewsTVC")
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

extension NewsDataSourceDelegate: UITableViewDelegate {
    
    /// Method called when a row is selected in the table view
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate.didselect(tblvw, didSelectRowAt: indexPath)
    }
}

// MARK: - UITableViewDataSource

extension NewsDataSourceDelegate: UITableViewDataSource {
    
    /// Number of rows in the table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrSource.count
    }
    
    /// Configures and returns a table view cell for the specified row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblvw.dequeueReusableCell(withIdentifier: "NewsTVC", for: indexPath) as! NewsTVC
        cell.configCell(data: arrSource[indexPath.row])
        cell.btnBookmark.tag = indexPath.row
        cell.btnBookmark.addTarget(self, action: #selector(addAction(_:)), for: .touchUpInside)
        cell.btnShare.addTarget(self, action: #selector(shareAction(_:)), for: .touchUpInside)
        return cell
    }
    
    /// Handles bookmark button action
    @objc func addAction(_ sender: UIButton){
        sender.isSelected.toggle()
        arrSource[sender.tag].isBookmarked.toggle()
    }
    
    /// Handles share button action
    @objc func shareAction(_ sender: UIButton){
        let indexPath = IndexPath(row: sender.tag, section: 0)
        let selectedNews = arrSource[indexPath.row]
        let urlToShare = selectedNews.url
        
        let alertController = UIAlertController(title: "Share News", message: "Copy the link below", preferredStyle: .actionSheet)
        
        let copyAction = UIAlertAction(title: urlToShare, style: .default) { (_) in
            UIPasteboard.general.string = urlToShare

            let alert = UIAlertController(title: "Link Copied", message: "The link has been copied to the clipboard.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            self.viewController.present(alert, animated: true, completion: nil)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(copyAction)
        alertController.addAction(cancelAction)
        
        if let popoverController = alertController.popoverPresentationController {
            popoverController.sourceView = sender
            popoverController.sourceRect = sender.bounds
        }
        
        viewController.present(alertController, animated: true, completion: nil) // Use viewController to present the alert controller
    }
}
