//
//  NextViewController.swift
//  Exercise4
//
//  Created by Yug Mistry on 08/04/24.
//

import UIKit

class Screen2VC: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet var nextView: UIView!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnRegister: UIButton!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = nextView.bounds
        let lightOrangeColor = UIColor(red: 1.0, green: 0.8, blue: 0.4, alpha: 1.0).cgColor
        let orangeColor = UIColor.orange.cgColor
        gradientLayer.colors = [lightOrangeColor, orangeColor]

        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)

        // Apply the gradient to the backgroundGradientView.
        nextView.layer.insertSublayer(gradientLayer,at: 0)
        
        btnLogin.layer.cornerRadius = btnLogin.frame.height/4
        
        btnRegister.layer.cornerRadius = btnRegister.frame.height/4
        btnRegister.layer.borderColor = UIColor.white.cgColor
        btnRegister.layer.borderWidth = 1
        
    }
    
    // MARK: - Actions
    
    @IBAction func changeToMainView(_ sender: UIButton) {
    }
    
    @IBAction func changeToStack(_ sender: UIButton) {
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
