//
//  ViewController.swift
//  Exercise4
//
//  Created by Yug Mistry on 08/04/24.
//

import UIKit

class Screen1VC: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var txtView: UIView!
    @IBOutlet weak var btnSkip: UIButton!
    @IBOutlet weak var btnNext: UIButton!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        txtView.layer.cornerRadius = txtView.frame.height/2
    }
    
    // MARK: - Actions
    
    @IBAction func changeToSkipView(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func changeToNextView(_ sender: UIButton) {
 
    }
    
}

