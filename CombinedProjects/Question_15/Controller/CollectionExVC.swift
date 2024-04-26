//
//  CollectionExVC.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 19/04/24.
//

import UIKit

/// View Controller responsible for displaying data in a collection view.
class CollectionExVC: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var collectionVW: UICollectionView!
    
    // MARK: - Properties
    
    /// Instance of UserWebService to fetch user data from a web service.
    var webService = UserWebService()
    
    /// Instance of CollectionExDataSourceDelegate to manage collection view data source and delegate.
    var collectionExDataSourceDelegate: CollectionExDataSourceDelegate!
    
    /// Array to store user data fetched from the web service.
    var arrData: [UserModel] = []
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    // MARK: - Button Action
    
    /// Action triggered when the back button is tapped.
    @IBAction func btnBackAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Data Fetching
    
    /// Method to fetch user data from the web service.
    func getData() {
        webService.getUserList { arr in
            self.arrData = arr
        }
        setupTblView()
    }
    
    // MARK: - Table View Setup
    
    /// Method to setup collection view with necessary configurations.
    func setupTblView() {
        if collectionExDataSourceDelegate == nil {
            collectionExDataSourceDelegate = .init(arrData: arrData, delegate: self, col: collectionVW, vc: self)
        } else {
            collectionExDataSourceDelegate.reload(arr: arrData)
        }
    }

}

// MARK: - CollectionExViewDelegate

extension CollectionExVC: CollectionExViewDelegate {
    
    /// Method called when an item is selected in the collection view.
    func didSelect(colView: UICollectionView, indexPath: IndexPath) {
        // Code to handle item selection
    }
}
