//
//  SideMenuItemTVC.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 23/04/24.
//

import UIKit

class SideMenuItemTVC: UITableViewCell {

    @IBOutlet weak var imgVW: UIImageView!
    @IBOutlet weak var lblItem: UILabel!
    @IBOutlet weak var seperatorVW: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(data : SideMenuItemModel){
        lblItem.text = data.TitleKey
        imgVW.image = UIImage(named: data.Image)
    }
    
}
