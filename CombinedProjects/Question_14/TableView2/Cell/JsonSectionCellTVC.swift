//
//  jsonSectionCellTVCTableViewCell.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 17/04/24.
//

import UIKit

class JsonSectionCellTVC: UITableViewCell {

    @IBOutlet weak var imgVW: UIImageView!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblFName: UILabel!
    @IBOutlet weak var lblLName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(data:UserSectionModel){
        lblEmail.text = data.email
        lblFName.text = data.fname
        lblLName.text = data.lname
        imgVW.fetchImage(from: data.imgAvatar)
        
        imgVW.layer.cornerRadius = imgVW.frame.height/2.2
        imgVW.layer.borderWidth = 1
        imgVW.layer.masksToBounds = true
        imgVW.layer.borderColor = UIColor.blue.cgColor
    }
    
}
