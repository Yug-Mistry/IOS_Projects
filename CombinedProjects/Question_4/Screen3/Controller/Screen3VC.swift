//
//  SkipViewController.swift
//  Exercise4
//
//  Created by Yug Mistry on 08/04/24.
//

import UIKit

class Screen3VC: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var btnGoogle: UIButton!
    @IBOutlet weak var btnCreateAccount: UIButton!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnGoogle.superview?.layer.cornerRadius = btnGoogle.frame.height/4
        btnCreateAccount.layer.cornerRadius = btnCreateAccount.frame.height/4
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Actions

    @IBAction func changeToColorChangeView(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func changeToMainView(_ sender: Any) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
