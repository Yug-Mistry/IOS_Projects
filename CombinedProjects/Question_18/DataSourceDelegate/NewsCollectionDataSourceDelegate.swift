//
//  NewsCollectionDataSourceDelegate.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 01/05/24.
//

import Foundation
import UIKit

protocol ColViewDelegate {
    func didSelect(colView: UICollectionView, indexPath: IndexPath)
}

class NewsCollectionDatasourceDelegate: NSObject {
    
    typealias T = NewsModel
    typealias col = UICollectionView
    typealias del = ColViewDelegate
    typealias vc = UIViewController
    
    internal var height: Float
    internal var arrSource: [T]
    internal var colvw: col
    internal var delegate: del
    internal var viewController:vc
    
    let kNumberOfItemsInOneRow: CGFloat = 2
    let kEdgeInset:CGFloat = 16
    let minimumInterItemandLinespacing:CGFloat = 12
    
    //MARK:- Initializers
    required init(arrData: [T], delegate: ColViewDelegate, col: UICollectionView,vc:vc, height: Float) {
        arrSource = arrData
        colvw = col
        self.height = height
        self.delegate = delegate
        self.viewController = vc
        super.init()
        setupCol()
    }
    
    fileprivate func setupCol(){
        
        let nib = UINib(nibName: "NewsCVC", bundle: nil)
        colvw.register(nib, forCellWithReuseIdentifier: "NewsCVC")
        colvw.dataSource = self
        colvw.delegate = self
        colvw.reloadData()
    }
    
    func reload(arr:[T]){
        arrSource = arr
        colvw.reloadData()
    }
}

extension NewsCollectionDatasourceDelegate:UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate.didSelect(colView: colvw, indexPath: indexPath)
    }
    
}
extension NewsCollectionDatasourceDelegate:UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsCVC", for: indexPath) as! NewsCVC
        cell.configureCell(data: arrSource[indexPath.row])
        cell.btnBookmark.tag = indexPath.row
        cell.btnBookmark.addTarget(self, action: #selector(addAction(_:)), for: .touchUpInside)
        cell.btnShare.addTarget(self, action: #selector(shareAction(_:)), for: .touchUpInside)
        return cell
    }
    
    @objc func addAction(_ sender: UIButton){
        sender.isSelected.toggle()
        arrSource[sender.tag].isBookmarked.toggle()
    }
    
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


//MARK:- UICollectionViewDelegateFlowLayout Methods
extension NewsCollectionDatasourceDelegate: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return minimumInterItemandLinespacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return minimumInterItemandLinespacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 44) / 2.3
        return .init(width: width, height: CGFloat(height))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: kEdgeInset, left: kEdgeInset, bottom: kEdgeInset, right: kEdgeInset)
    }
}

//extension String {
//    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
//        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
//        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
//        
//        return ceil(boundingBox.height)
//    }
//}
