//
//  LoginViewController.swift
//  Exercise4
//
//  Created by Yug Mistry on 09/04/24.
//

import UIKit

class LoginSmallVC: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var btnLogin: UIButton!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Actions
    
    @IBAction func btnLoginAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }

}
