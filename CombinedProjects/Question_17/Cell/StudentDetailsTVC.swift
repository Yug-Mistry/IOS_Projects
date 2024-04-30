//
//  StudentDataTVC.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 29/04/24.
//

import UIKit

class StudentDetailsTVC: UITableViewCell {

    @IBOutlet weak var lblKey: UILabel!
    @IBOutlet weak var lblValue: UILabel!
    @IBOutlet weak var sepVW: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Configuration Method
    
    /// Configure the cell with user data
    /// - key: The variable containing key value
    /// - value: The variable conaining value of key
    func configCell(key: String,value: String ){
        lblKey.text = key
        lblValue.text = value
    }
    
}
