//
//  NewsListVC.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 30/04/24.
//

import UIKit

class NewsListVC: UIViewController {
    
    @IBOutlet weak var tblVW: UITableView!
    
    var webService = NewsWebService()
    var newsDataSourceDelegate : NewsDataSourceDelegate!
    static var arrData : [NewsModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    func getData(){
        webService.getNewsList { arr in
            NewsListVC.arrData = arr
        }
        setupTblView()
    }
    
    func setupTblView(){
        if newsDataSourceDelegate == nil {
            newsDataSourceDelegate = .init(arrData: NewsListVC.arrData, delegate: self, tbl: tblVW, viewController: self)
        }
        else{
            reload()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        reload()
    }
    
    func reload(){
        newsDataSourceDelegate.reload(arr: NewsListVC.arrData)
    }
    
    @IBAction func btnBackAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}

extension NewsListVC: TblViewDelegate {
    func didselect(_ tbl: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "NewsDetail", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "NewsDetailVC") as! NewsDetailVC
        viewController.selectedNews = NewsListVC.arrData[indexPath.row]
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

