//
//  NewsCVC.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 01/05/24.
//

import UIKit

/// Collection view cell for displaying news items.
class NewsCVC: UICollectionViewCell {

    // MARK: - Outlets
    
    /// Image view displaying the news image.
    @IBOutlet weak var imgVW: UIImageView!
    /// Label displaying the news category.
    @IBOutlet weak var lblCategory: UILabel!
    /// Label displaying the news content.
    @IBOutlet weak var lblContent: UILabel!
    /// Label displaying additional information about the news.
    @IBOutlet weak var lblInfo: UILabel!
    /// Button to bookmark/unbookmark the news item.
    @IBOutlet weak var btnBookmark: UIButton!
    /// Button to share the news item.
    @IBOutlet weak var btnShare: UIButton!
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Apply corner radius to the image view's superview for a rounded appearance
        imgVW.superview?.layer.cornerRadius = 10
    }

    // MARK: - Configuration Method
    
    /// Configure the cell with news item data.
    /// - Parameter data: The news item data to be displayed.
    func configureCell(data: NewsModel){
        // Fetch and display the news image
        imgVW.fetchImage(from: data.urlToImage)
        // Display the news category
        lblCategory.text = data.category
        // Display the news content
        lblContent.text = data.content
        // Display additional information about the news
        lblInfo.text =  String(data.minRead) + " min read • " + data.publishedAt
    }
}
