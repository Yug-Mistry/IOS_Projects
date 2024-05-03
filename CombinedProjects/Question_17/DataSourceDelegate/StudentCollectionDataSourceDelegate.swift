//
//  StudentCollectionDataSourceDelegate.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 29/04/24.
//

import Foundation
import UIKit

/// Protocol defining methods for handling collection view selection events.
protocol StudentCollectionViewDelegate: AnyObject {
    
    /// Called when an item in the collection view is selected.
    /// - Parameters:
    ///   - colView: The collection view in which the item is selected.
    ///   - indexPath: The index path of the selected item.
    func didSelect(colView: UICollectionView, indexPath: IndexPath)
}

/// Class responsible for managing collection view data source and delegate.
class StudentCollectionDataSourceDelegate: NSObject {
    
    // MARK: - Type Aliases
    
    typealias T = StudentModel
    typealias Col = UICollectionView
    typealias Del = StudentCollectionViewDelegate
    typealias VC = UIViewController
    
    // MARK: - Properties
    
    /// Array containing data source for the collection view.
    private var arrSource: [T]
    /// Collection view instance.
    private var colvw: Col
    /// Delegate for collection view events.
    private var delegate: Del
    /// Weak reference to the view controller.
    private weak var vc: VC?
    
    /// Number of items to be displayed in one row of the collection view.
    private let kNumberOfItemsInOneRow: CGFloat = 2
    /// Edge inset for the collection view.
    private let kEdgeInset: CGFloat = 8
    /// Minimum inter-item and line spacing for the collection view.
    private let minimumInterItemandLinespacing: CGFloat = 0
    
    // MARK: - Initializers
    
    /// Initializes a CollectionDataSourceDelegate object with the provided data, delegate, collection view, and view controller.
    /// - Parameters:
    ///   - arrData: The array of StudentModel objects to be displayed.
    ///   - delegate: The delegate conforming to StudentCollectionViewDelegate protocol.
    ///   - col: The collection view to be managed.
    ///   - vc: The view controller owning the collection view.
    required init(arrData: [T], delegate: Del, col: Col, vc: VC) {
        self.arrSource = arrData
        self.colvw = col
        self.delegate = delegate
        self.vc = vc
        super.init()
        setupCol()
    }
    
    // MARK: - Setup
    
    /// Sets up the collection view with necessary configurations.
    fileprivate func setupCol() {
        let nib = UINib(nibName: "StudentCVC", bundle: nil)
        colvw.register(nib, forCellWithReuseIdentifier: "StudentCVC")
        colvw.dataSource = self
        colvw.delegate = self
        colvw.reloadData()
    }
    
    // MARK: - Data Reloading
    
    /// Reloads the collection view with updated data.
    func reload(arr: [T]) {
        arrSource = arr
        colvw.reloadData()
    }
}

// MARK: - UICollectionViewDelegate

extension StudentCollectionDataSourceDelegate: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate.didSelect(colView: colvw, indexPath: indexPath)
    }
}

// MARK: - UICollectionViewDataSource

extension StudentCollectionDataSourceDelegate: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StudentCVC", for: indexPath) as! StudentCVC
        cell.configureCell(data: arrSource[indexPath.row])
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout Methods

extension StudentCollectionDataSourceDelegate: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return minimumInterItemandLinespacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return minimumInterItemandLinespacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 28) / 2
        let height = width + 20
        let lineHeight = "test".height(withConstrainedWidth: width, font: .systemFont(ofSize: 14, weight: .regular))
        return .init(width: width, height: height + (lineHeight * 2))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: kEdgeInset, left: kEdgeInset, bottom: kEdgeInset, right: kEdgeInset)
    }
}
