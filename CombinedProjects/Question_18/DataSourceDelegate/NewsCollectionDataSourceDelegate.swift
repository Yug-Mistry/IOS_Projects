//
//  NewsCollectionDataSourceDelegate.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 01/05/24.
//

import Foundation
import UIKit

/// Protocol for handling collection view delegate events
protocol ColViewDelegate {
    func didSelect(colView: UICollectionView, indexPath: IndexPath)
}

/// Class responsible for managing collection view data source and delegate for NewsModel data
class NewsCollectionDatasourceDelegate: NSObject {
    
    // MARK: - Type Aliases
    
    /// Alias for NewsModel
    typealias T = NewsModel
    /// Alias for UICollectionView
    typealias col = UICollectionView
    /// Alias for ColViewDelegate
    typealias del = ColViewDelegate
    /// Alias for UIViewController
    typealias vc = UIViewController
    
    // MARK: - Properties
    
    /// Height of the collection view cell
    internal var height: Float
    /// Array containing data source for collection view
    internal var arrSource: [T]
    /// Collection view instance
    internal var colvw: col
    /// Delegate for collection view events
    internal var delegate: del
    /// View controller where the collection view resides
    internal var viewController: vc
    
    // Constants for layout
    let kNumberOfItemsInOneRow: CGFloat = 2
    let kEdgeInset:CGFloat = 16
    let minimumInterItemandLinespacing:CGFloat = 12
    
    // MARK: - Initializers
    
    /// Initializes NewsCollectionDatasourceDelegate with data source, delegate, collection view, view controller, and cell height
    /// - Parameters:
    ///   - arrData: Data source for the collection view
    ///   - delegate: Delegate for collection view events
    ///   - col: Collection view instance
    ///   - vc: View controller where the collection view resides
    ///   - height: Height of the collection view cell
    required init(arrData: [T], delegate: ColViewDelegate, col: UICollectionView, vc: vc, height: Float) {
        arrSource = arrData
        colvw = col
        self.height = height
        self.delegate = delegate
        self.viewController = vc
        super.init()
        setupCol()
    }
    
    // MARK: - Collection View Setup
    
    /// Setup collection view with necessary configurations
    fileprivate func setupCol(){
        let nib = UINib(nibName: "NewsCVC", bundle: nil)
        colvw.register(nib, forCellWithReuseIdentifier: "NewsCVC")
        colvw.dataSource = self
        colvw.delegate = self
        colvw.reloadData()
    }
    
    // MARK: - Data Reload
    
    /// Reload collection view data with updated data source
    /// - Parameter arr: Updated data source for the collection view
    func reload(arr: [T]){
        arrSource = arr
        colvw.reloadData()
    }
}

// MARK: - UICollectionViewDelegate

extension NewsCollectionDatasourceDelegate: UICollectionViewDelegate {
    
    /// Method called when an item is selected in the collection view
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate.didSelect(colView: colvw, indexPath: indexPath)
    }
}

// MARK: - UICollectionViewDataSource

extension NewsCollectionDatasourceDelegate: UICollectionViewDataSource {
    
    /// Number of items in the collection view
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrSource.count
    }
    
    /// Configures and returns a collection view cell for the specified index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsCVC", for: indexPath) as! NewsCVC
        cell.configureCell(data: arrSource[indexPath.row])
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
        
        viewController.present(alertController, animated: true, completion: nil)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension NewsCollectionDatasourceDelegate: UICollectionViewDelegateFlowLayout {
    
    /// Spacing between items in a row
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return minimumInterItemandLinespacing
    }
    
    /// Spacing between items in a column
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return minimumInterItemandLinespacing
    }
    
    /// Size of items in the collection view
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 44) / 2.3
        return .init(width: width, height: CGFloat(height))
    }
    
    /// Insets for the section
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: kEdgeInset, left: kEdgeInset, bottom: kEdgeInset, right: kEdgeInset)
    }
}
