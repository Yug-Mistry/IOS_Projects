//
//  CellTVC.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 16/04/24.
//

import UIKit

// UITableViewCell subclass for displaying employee details
class CellTVC: UITableViewCell {

    // Outlets for UI elements in the cell
    @IBOutlet weak var lblProfile: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDOB: UILabel!
    @IBOutlet weak var lblDepartment: UILabel!
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // Method called when the cell's layout is updated
    override func layoutSubviews() {
        super.layoutSubviews()
        // Configure profile label's appearance
        lblProfile.superview?.layer.cornerRadius = lblProfile.superview!.frame.height / 2
        lblProfile.superview?.layer.masksToBounds = true
        lblProfile.superview?.layer.borderWidth = 1
        lblProfile.superview?.layer.borderColor = UIColor.red.cgColor
    }

    // Method called when the cell is selected
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // Method to configure the cell with employee data
    func configCell(data: [String]) {
        // Set label texts with data from the array
        lblName.text = data[0]
        lblProfile.text = String((lblName.text?.first)!)
        lblDOB.text = data[1]
        lblDepartment.text = data[2]
    }
}
