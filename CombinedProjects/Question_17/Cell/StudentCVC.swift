//
//  StudentCVC.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 29/04/24.
//

import UIKit

class StudentCVC: UICollectionViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var lblInitial: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var layoutVW: UIView!
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // Additional layout setup
    }
    
    // MARK: - Configuration Method
    
    /// Configures the cell with user data.
    ///
    /// - Parameter data: The UserModel object containing user data.
    func configureCell(data: StudentModel) {
        lblName.text = data.name
        lblInitial.text  = data.name.prefix(1).uppercased()
        
        lblName.superview?.layer.cornerRadius = 40
        lblName.superview?.layer.masksToBounds = true
        lblName.superview?.layer.borderWidth = 1
        addShadow(to: layoutVW, shadowRadius: 8.0, shadowColor: UIColor.black.cgColor, shadowOpacity: 0.8, shadowOffset: CGSize(width: 0, height: 0))
    }
    
    // MARK: - Helper Method
    
    /// Adds shadow effect to a view.
    ///
    /// - Parameters:
    ///   - view: The view to which the shadow should be added.
    ///   - shadowRadius: The radius of the shadow.
    ///   - shadowColor: The color of the shadow.
    ///   - shadowOpacity: The opacity of the shadow.
    ///   - shadowOffset: The offset of the shadow.
    func addShadow(to view: UIView, shadowRadius: CGFloat = 0.0, shadowColor: CGColor? = UIColor.black.cgColor, shadowOpacity: Float = 1.0, shadowOffset: CGSize = CGSize(width: 0, height: 0)) {
        view.layer.shadowColor = shadowColor
        view.layer.shadowOffset = shadowOffset
        view.layer.shadowRadius = shadowRadius
        view.layer.shadowOpacity = shadowOpacity
        view.layer.masksToBounds = false
    }

}
