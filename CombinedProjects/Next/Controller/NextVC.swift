//
//  NextVC.swift
//  Exercise8
//
//  Created by Yug Mistry on 10/04/24.
//

import UIKit

/// View controller for the next screen in the navigation stack.
class NextVC: UIViewController {
    
    /// Button to navigate back to the previous screen.
    @IBOutlet weak var btnBack: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    /// Action triggered when the back button is tapped.
    /// - Parameter sender: The button that triggered the action.
    @IBAction func btnBackAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }

}
