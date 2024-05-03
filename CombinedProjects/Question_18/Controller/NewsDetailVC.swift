//
//  NewsDetailVC.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 01/05/24.
//

import UIKit

/// View controller for displaying the details of a news item.
class NewsDetailVC: UIViewController {

    // MARK: - Outlets
    
    /// Collection view displaying related news items.
    @IBOutlet weak var collectionVW: UICollectionView!
    /// Image view displaying the news item's image.
    @IBOutlet weak var imgVW: UIImageView!
    /// Label displaying the news item's category.
    @IBOutlet weak var lblCategory: UILabel!
    /// Label displaying the news item's title.
    @IBOutlet weak var lblTitle: UILabel!
    /// Button displaying the news item's author.
    @IBOutlet weak var btnAuthor: UIButton!
    /// Label displaying additional information about the news item.
    @IBOutlet weak var lblInfo: UILabel!
    /// Label displaying the content of the news item.
    @IBOutlet weak var lblContent: UILabel!
    /// Button for bookmarking/unbookmarking the news item.
    @IBOutlet weak var btnBookmark: UIButton!
    /// Constraint for adjusting the height of the collection view.
    @IBOutlet weak var collectionVWHeight: NSLayoutConstraint!
    
    // MARK: - Properties
    
    /// The selected news item.
    var selectedNews: NewsModel!
    /// Array containing related news items.
    var arrNews: [NewsModel]!
    /// Data source and delegate for the collection view.
    var datasourceDelegate: NewsCollectionDatasourceDelegate!
    /// Web service instance for fetching news data.
    var webService = NewsWebService()
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Data Fetching
    
    /// Fetches related news data.
    func getData(){
        self.arrNews = NewsListVC.arrData.filter { $0.category == self.selectedNews.category && $0.id != self.selectedNews.id }
        setupView()
    }

    // MARK: - View Setup
    
    /// Sets up the view with news item details.
    func setupView(){
        btnBookmark.isSelected = selectedNews.isBookmarked
        imgVW.fetchImage(from: selectedNews.urlToImage)
        lblCategory.text = selectedNews.category
        lblTitle.text = selectedNews.title
        btnAuthor.setTitle(selectedNews.author,for: .normal)
        lblInfo.text = String(selectedNews.minRead) + " min read • " + selectedNews.publishedAt
        lblContent.text = selectedNews.content
        setupCollection()
    }
    
    /// Sets up the collection view to display related news items.
    func setupCollection() {
        let width = (collectionVW.frame.width - 44) / 2.3
        let height = width/2 + 10
        let lineHeight = ("abc".height(withConstrainedWidth: width, font: .systemFont(ofSize: 14, weight: .regular)) * 2) + "abc".height(withConstrainedWidth: width, font: .systemFont(ofSize: 18, weight: .bold)) + "abc".height(withConstrainedWidth: width, font: .systemFont(ofSize: 12, weight: .regular)) + 60
        let finalHeight = height + lineHeight
        collectionVWHeight.constant = finalHeight
        if datasourceDelegate == nil {
            datasourceDelegate = .init(arrData: arrNews, delegate: self, col: collectionVW,vc:self, height: Float(finalHeight))
        } else {
            datasourceDelegate.reload(arr: arrNews)
        }
    }
    
    // MARK: - Button Actions
    
    /// Handles the bookmark button action.
    @IBAction func btnBookmarkAction(_ sender: UIButton) {
        btnBookmark.isSelected.toggle()
        for data in NewsListVC.arrData{
            if data.id == selectedNews.id {
                data.isBookmarked.toggle()
                break
            }
        }
    }
    
    /// Handles the back button action.
    @IBAction func btnBackAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - ColViewDelegate

extension NewsDetailVC: ColViewDelegate {
    /// Handles the selection of a related news item in the collection view.
    func didSelect(colView: UICollectionView, indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "NewsDetail", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "NewsDetailVC") as! NewsDetailVC
        viewController.selectedNews = arrNews[indexPath.row]
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
