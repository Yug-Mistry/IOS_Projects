//
//  CountryNameCellVC.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 15/04/24.
//

import UIKit

class CountryNameTVC: UITableViewCell {
    
    @IBOutlet weak var lblCountryName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(data:String){
        lblCountryName.text = data
    }

}
