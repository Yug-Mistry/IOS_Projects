//
//  SideMenuItemTVC.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 23/04/24.
//

import UIKit

/// Custom table view cell for displaying side menu items.
class SideMenuItemTVC: UITableViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var imgVW: UIImageView!
    @IBOutlet weak var lblItem: UILabel!
    @IBOutlet weak var seperatorVW: UIView!
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Configuration
    
    /// Configures the cell with the provided data.
    /// - Parameter data: The data model containing information for the cell.
    func configCell(data : SideMenuItemModel){
        lblItem.text = data.TitleKey
        imgVW.image = UIImage(named: data.Image)
    }
    
}
