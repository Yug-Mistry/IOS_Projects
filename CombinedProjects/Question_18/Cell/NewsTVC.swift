//
//  NewsTVC.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 01/05/24.
//

import UIKit

class NewsTVC: UITableViewCell {

    @IBOutlet weak var cellVW: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblContent: UILabel!
    @IBOutlet weak var lblInfo: UILabel!
    @IBOutlet weak var imgVW: UIImageView!
    @IBOutlet weak var btnBookmark: UIButton!
    @IBOutlet weak var btnShare: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        imgVW.superview?.layer.cornerRadius = 10
        imgVW.layer.cornerRadius = 10
        cellVW.layer.cornerRadius = 15
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        }
    func configCell(data: NewsModel){
        imgVW.fetchImage(from: data.urlToImage)
        lblTitle.text = data.category
        lblContent.text = data.title
        lblInfo.text = String(data.minRead) + " min read • " + data.publishedAt
        btnBookmark.isSelected = data.isBookmarked
        btnShare.accessibilityHint = data.url
    }
}
