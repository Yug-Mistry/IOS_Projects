//
//  ToDoListTVC.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 22/04/24.
//

import UIKit

class ToDoListTVC: UITableViewCell {
    
    @IBOutlet weak var lblContent: UILabel!
    @IBOutlet weak var txtContent: UITextField!
    @IBOutlet weak var btnDelete: UIButton!
    @IBOutlet weak var btnAdd: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func configCell(data: ToDoListModel){
        txtContent.text = ""
        txtContent.placeholder = "Enter Value"
        lblContent.text = data.content
        if data.isEditing{
            lblContent.isHidden = true
            btnDelete.isHidden = true
            txtContent.isHidden = false
            btnAdd.isHidden = false
        }else{
            txtContent.isHidden = true
            btnAdd.isHidden = true
            lblContent.isHidden = false
            btnDelete.isHidden = false
        }
    }
    
}
