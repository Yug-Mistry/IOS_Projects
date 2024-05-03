//
//  NewsTVC.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 01/05/24.
//

import UIKit

/// Table view cell for displaying news items.
class NewsTVC: UITableViewCell {

    // MARK: - Outlets
    
    /// Container view for the cell.
    @IBOutlet weak var cellVW: UIView!
    /// Label displaying the news title.
    @IBOutlet weak var lblTitle: UILabel!
    /// Label displaying the news content.
    @IBOutlet weak var lblContent: UILabel!
    /// Label displaying additional information about the news.
    @IBOutlet weak var lblInfo: UILabel!
    /// Image view displaying the news image.
    @IBOutlet weak var imgVW: UIImageView!
    /// Button to bookmark/unbookmark the news item.
    @IBOutlet weak var btnBookmark: UIButton!
    /// Button to share the news item.
    @IBOutlet weak var btnShare: UIButton!
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Apply corner radius to image view and container view
        imgVW.superview?.layer.cornerRadius = 10
        imgVW.layer.cornerRadius = 10
        cellVW.layer.cornerRadius = 15
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    // MARK: - Configuration Method
    
    /// Configure the cell with news item data.
    /// - Parameter data: The news item data to be displayed.
    func configCell(data: NewsModel){
        // Fetch and display the news image
        imgVW.fetchImage(from: data.urlToImage)
        // Display the news category as the title
        lblTitle.text = data.category
        // Display the news title
        lblContent.text = data.title
        // Display additional information about the news
        lblInfo.text = String(data.minRead) + " min read • " + data.publishedAt
        // Set the bookmark button's selected state based on whether the news item is bookmarked
        btnBookmark.isSelected = data.isBookmarked
        // Set the accessibility hint of the share button to the news item's URL
        btnShare.accessibilityHint = data.url
    }
}
