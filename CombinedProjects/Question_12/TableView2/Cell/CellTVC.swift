//
//  CellTVC.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 16/04/24.
//

import UIKit

class CellTVC: UITableViewCell {

    @IBOutlet weak var lblProfile: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDOB: UILabel!
    @IBOutlet weak var lblDepartment: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        lblProfile.superview?.layer.cornerRadius = lblProfile.superview!.frame.height/2
        lblProfile.superview?.layer.masksToBounds = true
        lblProfile.superview?.layer.borderWidth = 1
        lblProfile.superview?.layer.borderColor = UIColor.red.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(data:[String]){
        lblName.text = data[0]
        lblProfile.text = String((lblName.text?.first)!)
        lblDOB.text = data[1]
        lblDepartment.text  = data[2]
        
    }
    
}
