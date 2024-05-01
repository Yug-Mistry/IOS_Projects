//
//  NewsCVC.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 01/05/24.
//

import UIKit

class NewsCVC: UICollectionViewCell {

    @IBOutlet weak var imgVW: UIImageView!
    @IBOutlet weak var lblCategory: UILabel!
    @IBOutlet weak var lblContent: UILabel!
    @IBOutlet weak var lblInfo: UILabel!
    @IBOutlet weak var btnBookmark: UIButton!
    @IBOutlet weak var btnShare: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imgVW.superview?.layer.cornerRadius = 10
    }

    func configureCell(data: NewsModel){
        imgVW.fetchImage(from: data.urlToImage)
        lblCategory.text = data.category
        lblContent.text = data.content
        lblInfo.text =  String(data.minRead) + " min read • " + data.publishedAt
    }
}
