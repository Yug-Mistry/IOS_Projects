//
//  ChangeColorViewController.swift
//  Exercise4
//
//  Created by Yug Mistry on 09/04/24.
//

import UIKit

class ColorChangeVC: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var btnCool: UIView!
    @IBOutlet weak var btnWarm: UIView!
    @IBOutlet weak var btnBackground: UIButton!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btnNext: UIButton!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Actions

    @IBAction func changeColor(_ sender: UIButton) {
        if (sender.currentTitle == "Cool"){
            bgView.layer.backgroundColor = UIColor.systemBlue.cgColor
        }else if(sender.currentTitle == "Warm"){
            bgView.layer.backgroundColor = UIColor.systemYellow.cgColor
        }else{
            bgView.layer.backgroundColor = UIColor.systemGreen.cgColor
        }
    }
    
    @IBAction func changeToNextView(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func changeToLoginView(_ sender: UIButton) {
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
