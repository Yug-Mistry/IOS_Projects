//
//  MultiStackViewController.swift
//  Exercise4
//
//  Created by Yug Mistry on 10/04/24.
//

import UIKit

class MultiStackVC: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var btnRed: UIButton!
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Actions
    
    @IBAction func btnRedAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
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
