//
//  StudentDetailsTVC.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 29/04/24.
//

import UIKit

/// UITableViewCell subclass for displaying student details
class StudentDetailsTVC: UITableViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var lblKey: UILabel!
    @IBOutlet weak var lblValue: UILabel!
    @IBOutlet weak var sepVW: UIView!
    
    // MARK: - Lifecycle Methods
    
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
    /// - Parameters:
    ///   - key: The key value to display
    ///   - value: The corresponding value to display
    func configCell(key: String, value: String) {
        lblKey.text = key
        lblValue.text = value
    }
    
}
