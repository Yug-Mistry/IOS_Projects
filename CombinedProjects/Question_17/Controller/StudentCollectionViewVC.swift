//
//  StudentCollectionViewVC.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 29/04/24.
//

import UIKit

/// UIViewController subclass for displaying a collection view of students
class StudentCollectionViewVC: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var collectionVW: UICollectionView!
    
    // MARK: - Properties
    
    /// Instance of StudentWebService to fetch student data from a web service
    var webService = StudentWebService()
    
    /// Instance of StudentCollectionDataSourceDelegate to manage collection view data source and delegate
    var studentCollectionDataSourceDelegate: StudentCollectionDataSourceDelegate!
    
    /// Array to store student data fetched from the web service
    var arrData: [StudentModel] = []
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    // MARK: - Button Action
    
    /// Action method triggered when the back button is tapped
    @IBAction func btnBackAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Data Fetching
    
    /// Fetches student data from the web service
    func getData() {
        webService.getStudentList { arr in
            self.arrData = arr
            self.setupCollectionView()
        }
    }
    
    // MARK: - Collection View Setup
    
    /// Sets up the collection view with necessary configurations
    func setupCollectionView() {
        if studentCollectionDataSourceDelegate == nil {
            studentCollectionDataSourceDelegate = .init(arrData: arrData, delegate: self, col: collectionVW, vc: self)
        } else {
            studentCollectionDataSourceDelegate.reload(arr: arrData)
        }
    }

}

// MARK: - StudentCollectionViewDelegate

extension StudentCollectionViewVC: StudentCollectionViewDelegate {
    
    /// Called when an item is selected in the collection view
    func didSelect(colView: UICollectionView, indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "StudentDetails", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "StudentDetailsVC") as! StudentDetailsVC
        viewController.selectedStudent = arrData[indexPath.row]
        navigationController?.pushViewController(viewController, animated: true)
    }
}
