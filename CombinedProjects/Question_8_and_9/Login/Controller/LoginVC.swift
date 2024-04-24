//
//  ViewController.swift
//  Exercise8
//
//  Created by Yug Mistry on 10/04/24.
//

import UIKit

class LoginVC: UIViewController {

    //Mark :- Outlet
    @IBOutlet weak var btnRememberMe: UIButton!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnEye: UIButton!
    @IBOutlet weak var btnSignUp: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let email = UserDefaults.standard.string(forKey: "Email"){
            txtEmail.text = email
            btnRememberMe.isSelected = true
        }
        if let password = UserDefaults.standard.string(forKey: "Password"){
            txtPassword.text = password
            btnRememberMe.isSelected = true
        }

    }

    //Mark :- Actions
    
    //toggle remember me state
    @IBAction func btnRememberMeAction(_ sender: UIButton) {
        btnRememberMe.isSelected.toggle()
    }
    
    //toggle eye state and password visibility
    @IBAction func btnEyeAction(_ sender: Any) {
        btnEye.isSelected.toggle()
        txtPassword.isSecureTextEntry.toggle()
    }
    
    @IBAction func btnLoginAction(_ sender: UIButton) {
        
        guard let email = txtEmail.text, let password = txtPassword.text,!email.isEmpty,!password.isEmpty else {
            showAlert(title: "Validation Error", message: "Please Enter Email and Password")
            return
        }
            
        if isValidEmailAndPassword(email: email,password: password) {
            
            if(btnRememberMe.isSelected){
                UserDefaults.standard.setValue(txtEmail.text,forKey: "Email")
                UserDefaults.standard.setValue(txtPassword.text, forKey: "Password")
            }
            else{
                UserDefaults.standard.removeObject(forKey: "Email")
                UserDefaults.standard.removeObject(forKey: "Password")
            }
            
            let sb = UIStoryboard.init(name: "NextStoryboard", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier : "NextVC") as! NextVC
            navigationController?.pushViewController(vc, animated: true)
        } else {
            showAlert(title: "Validation Error", message: "Invalid Email and Password Format!")
        }
    }
            
    // email and password validation function
    func isValidEmailAndPassword( email: String, password: String) -> Bool {
        
        // Regular expression for email validation
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        
        // Regular expression for password validation
        // Password must contain at least 8 characters
        let passwordRegex = "^.{8,}$"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        
        if (emailPredicate.evaluate(with: email) && passwordPredicate.evaluate(with: password)) {
            return true
        }else{
            return false
        }
    }
    
    //show alert function
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }

    @IBAction func btnSignUpAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}

