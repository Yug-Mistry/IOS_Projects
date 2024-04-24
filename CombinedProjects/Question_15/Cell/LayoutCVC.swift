//
//  LayoutCVC.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 19/04/24.
//

import UIKit

class LayoutCVC: UICollectionViewCell {

    
    @IBOutlet weak var imgVW: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var layoutVW: UIView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    func configureCell(data: UserModel) {
        lblName.text = data.fname + " " + data.lname
        imgVW.fetchImage(from: data.imgAvatar)
        
        lblName.superview?.layer.cornerRadius = 40
        lblName.superview?.layer.masksToBounds = true
        lblName.superview?.layer.borderWidth = 1
        addShadow(to: layoutVW  ,shadowRadius: 8.0, shadowColor: UIColor.black.cgColor, shadowOpacity: 0.8, shadowOffset: CGSize(width: 0, height: 0))
    }
    
    func addShadow(to view: UIView, shadowRadius: CGFloat = 0.0, shadowColor: CGColor? = UIColor.black.cgColor, shadowOpacity: Float = 1.0, shadowOffset: CGSize = CGSize(width: 0, height: 0)) {
        view.layer.shadowColor = shadowColor
        view.layer.shadowOffset = shadowOffset
        view.layer.shadowRadius = shadowRadius
        view.layer.shadowOpacity = shadowOpacity
        view.layer.masksToBounds = false
    }

}
