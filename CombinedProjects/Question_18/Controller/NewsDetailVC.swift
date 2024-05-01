//
//  NewsDetailVC.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 01/05/24.
//

import UIKit

class NewsDetailVC: UIViewController {

    @IBOutlet weak var collectionVW: UICollectionView!
    @IBOutlet weak var imgVW: UIImageView!
    @IBOutlet weak var lblCategory: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var btnAuthor: UIButton!
    @IBOutlet weak var lblInfo: UILabel!
    @IBOutlet weak var lblContent: UILabel!
    @IBOutlet weak var btnBookmark: UIButton!
    @IBOutlet weak var collectionVWHeight: NSLayoutConstraint!
    
    var selectedNews: NewsModel!
    var arrNews: [NewsModel]!
    var datasourceDelegate: NewsCollectionDatasourceDelegate!
    var webService = NewsWebService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        // Do any additional setup after loading the view.
    }
    
    func getData(){
        self.arrNews = NewsListVC.arrData.filter { $0.category == self.selectedNews.category && $0.id != self.selectedNews.id }
        setupView()
    }

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
    
    func setupCollection() {
        let width = (collectionVW.frame.width - 44) / 2.3
        let height = width + 10
        let lineHeight = ("abc".height(withConstrainedWidth: width, font: .systemFont(ofSize: 14, weight: .regular)) * 2) + "abc".height(withConstrainedWidth: width, font: .systemFont(ofSize: 18, weight: .regular)) + "abc".height(withConstrainedWidth: width, font: .systemFont(ofSize: 12, weight: .regular))
        let finalHeight = height + lineHeight
        collectionVWHeight.constant = finalHeight
        if datasourceDelegate == nil {
            datasourceDelegate = .init(arrData: arrNews, delegate: self, col: collectionVW,vc:self, height: Float(finalHeight))
        } else {             
            datasourceDelegate.reload(arr: arrNews)
        }
    }
    
    @IBAction func btnBookmarkAction(_ sender: UIButton) {
        btnBookmark.isSelected.toggle()
        for data in NewsListVC.arrData{
            if data.id == selectedNews.id {
                data.isBookmarked.toggle()
                break
            }
        }
    }
    
    @IBAction func btnBackAction(_ sender: UIButton) {
        
        navigationController?.popViewController(animated: true)
    }
}

extension NewsDetailVC: ColViewDelegate {
    func didSelect(colView: UICollectionView, indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "NewsDetail", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "NewsDetailVC") as! NewsDetailVC
        viewController.selectedNews = arrNews[indexPath.row]
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
