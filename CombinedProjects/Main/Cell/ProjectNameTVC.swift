//
//  ProjectNameTVC.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 18/04/24.
//

import UIKit

class ProjectNameTVC: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(data: ProjectModel)
    {
        lblName.text = data.title
    }
    
}
