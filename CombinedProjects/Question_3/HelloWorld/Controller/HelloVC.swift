//
//  HelloVC.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 11/04/24.
//

import UIKit

class HelloVC: UIViewController {
    
    // MARK: - Outlets

    @IBOutlet weak var labelbox: UILabel!
    @IBOutlet weak var btnBack: UIButton!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
        let text="Hello World"
        labelbox.text=text
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.systemGreen.cgColor,UIColor.systemYellow.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
    
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at: 0)
            
          
    }
    
    // MARK: - Actions
    
    @IBAction func btnBackAction(_ sender: UIButton) {
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
