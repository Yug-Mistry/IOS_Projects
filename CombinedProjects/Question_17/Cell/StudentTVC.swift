//
//  StudentTVC.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 29/04/24.
//

import UIKit

class StudentTVC: UITableViewCell {

    @IBOutlet weak var lblInitial: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDepartment: UILabel!
    @IBOutlet weak var ProfileVW: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        ProfileVW.layer.cornerRadius = ProfileVW.frame.width/2
        ProfileVW.layer.borderColor = UIColor.blue.cgColor
        ProfileVW.layer.borderWidth = 1
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(data: StudentModel){
        lblInitial.text = data.name.prefix(1).uppercased()
        lblEmail.text = data.email
        lblName.text = data.name
        lblDepartment.text = data.department
    }
    
}


