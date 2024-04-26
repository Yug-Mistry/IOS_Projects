//
//  CountryNameCellVC.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 15/04/24.
//

import UIKit

// MARK: - Custom UITableViewCell Subclass

class CountryNameTVC: UITableViewCell {
    
    // MARK: Outlets
    
    @IBOutlet weak var lblCountryName: UILabel!

    // MARK: Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    // MARK: Configuration Method
    
    func configCell(data: String) {
        lblCountryName.text = data
    }
}
