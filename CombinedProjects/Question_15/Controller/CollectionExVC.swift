//
//  CollectionExVC.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 19/04/24.
//

import UIKit

class CollectionExVC: UIViewController {

    @IBOutlet weak var collectionVW: UICollectionView!
    
    var webService = UserWebService()
    var collectionExDataSourceDelegate : CollectionExDataSourceDelegate!
    var arrData : [UserModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    @IBAction func btnBackAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    func getData(){
        webService.getUserList { arr in
            self.arrData = arr
        }
        setupTblView()
    }


    func setupTblView(){
        if collectionExDataSourceDelegate == nil {
            collectionExDataSourceDelegate = .init(arrData: arrData, delegate: self, col: collectionVW,vc: self)
        }else{
            collectionExDataSourceDelegate.reload(arr: arrData)
        }
    }

}

extension CollectionExVC: CollectionExViewDelegate{
    func didSelect(colView: UICollectionView, indexPath: IndexPath) {
        
    }
}
