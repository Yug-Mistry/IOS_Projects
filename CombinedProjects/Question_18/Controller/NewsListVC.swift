//
//  NewsListVC.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 30/04/24.
//

import UIKit

/// View controller for displaying a list of news items.
class NewsListVC: UIViewController {
    
    // MARK: - Outlets
    
    /// Table view displaying the list of news items.
    @IBOutlet weak var tblVW: UITableView!
    
    // MARK: - Properties
    
    /// Instance of the web service for fetching news data.
    var webService = NewsWebService()
    /// Data source and delegate for the news table view.
    var newsDataSourceDelegate : NewsDataSourceDelegate!
    /// Array containing the news data.
    static var arrData : [NewsModel] = []
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    // MARK: - Data Fetching
    
    /// Fetches news data from the web service.
    func getData(){
        webService.getNewsList { arr in
            NewsListVC.arrData = arr
        }
        setupTblView()
    }
    
    // MARK: - Table View Setup
    
    /// Sets up the table view with news data.
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
    
    /// Reloads the table view with updated news data.
    func reload(){
        newsDataSourceDelegate.reload(arr: NewsListVC.arrData)
    }
    
    // MARK: - Button Actions
    
    /// Handles the action when the back button is pressed.
    @IBAction func btnBackAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}

extension NewsListVC: TblViewDelegate {
    /// Handles the selection of a news item in the table view.
    func didselect(_ tbl: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "NewsDetail", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "NewsDetailVC") as! NewsDetailVC
        viewController.selectedNews = NewsListVC.arrData[indexPath.row]
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
