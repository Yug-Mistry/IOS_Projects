//
//  NewsLoginVC.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 11/04/24.
//

import UIKit

class NewsLoginVC: UIViewController, UITextFieldDelegate {
    
    //Mark: - Variables
    var activeTextField:UITextField? = nil
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var lblError: UILabel!
    @IBOutlet weak var lblErrorHeight: NSLayoutConstraint!
    @IBOutlet weak var vwSignIn: UIView!
    @IBOutlet weak var vwEmail: UIView!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var vwPassword: UIView!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnEye: UIButton!
    @IBOutlet weak var btnRememberPassword: UIButton!
    @IBOutlet weak var btnSignIn: UIButton!
    @IBOutlet weak var btnSignInNo: UIButton!
    @IBOutlet weak var vwScrollView: UIScrollView!
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure text field keyboard types
        txtEmail.keyboardType = .emailAddress
        
        // Apply corner radius and border to views
        vwSignIn.layer.cornerRadius = vwSignIn.frame.height / 50
        vwEmail.layer.cornerRadius = txtEmail.frame.height / 6
        vwEmail.layer.borderWidth = 1
        vwEmail.layer.borderColor = UIColor.gray.cgColor
        vwPassword.layer.cornerRadius = txtPassword.frame.height / 6
        vwPassword.layer.borderWidth = 1
        vwPassword.layer.borderColor = UIColor.gray.cgColor
        btnSignIn.layer.cornerRadius = btnSignIn.frame.height / 5
        btnSignInNo.layer.cornerRadius = btnSignIn.frame.height / 5

        // Set text field delegates
        txtEmail.delegate = self
        txtPassword.delegate = self
        
        // Load saved password if available
        if let password = UserDefaults.standard.string(forKey: "Password") {
            txtPassword.text = password
            btnRememberPassword.isSelected = true
        }
        
        // Register for keyboard notifications
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // MARK: - Actions
    
    @IBAction func btnEyeAction(_ sender: UIButton) {
        // Toggle secure text entry for password field
        btnEye.isSelected.toggle()
        txtPassword.isSecureTextEntry.toggle()
    }
    
    @IBAction func btnRememberMeAction(_ sender: UIButton) {
        // Toggle remember password button state
        btnRememberPassword.isSelected.toggle()
    }
    
    @IBAction func btnSkipAction(_ sender: UIButton) {
        // Pop view controller to dismiss login screen
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnSignInAction(_ sender: UIButton) {
        // Validate email and password on sign in button tap
        hideValidationMessage()
        
        guard let email = txtEmail.text, !email.isEmpty else {
            showValidationMessage(message: "Please enter Email Address", color: "")
            txtEmail.becomeFirstResponder()
            return
        }
        
        guard let password = txtPassword.text, !password.isEmpty else {
            showValidationMessage(message: "Please enter password", color: "")
            txtPassword.becomeFirstResponder()
            return
        }
        
        if isValidEmailAndPassword(email: email, password: password) {
            // Save email and password if "Remember Me" is selected
            if btnRememberPassword.isSelected {
                UserDefaults.standard.setValue(txtEmail.text, forKey: "Email")
                UserDefaults.standard.setValue(txtPassword.text, forKey: "Password")
            } else {
                UserDefaults.standard.removeObject(forKey: "Email")
                UserDefaults.standard.removeObject(forKey: "Password")
            }
            showValidationMessage(message: "Login Successful", color: "green")
            // Navigate to next view controller
            let sb = UIStoryboard(name: "NextStoryboard", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "NextVC") as! NextVC
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    // MARK: - UITextFieldDelegate
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // Open the keyboard when a text field begins editing
        textField.becomeFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Dismiss keyboard when return/done button is tapped
        textField.resignFirstResponder()
        return true
    }
    
    // MARK: - Keyboard Handling
    
    @objc func keyboardWillShow(_ notification: Notification) {
        // Adjust scroll view content inset to move text field above keyboard
        guard let userInfo = notification.userInfo,
              let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else {
            return
        }
        let keyboardHeight = keyboardFrame.height * 1.2
        vwScrollView.contentInset.bottom = keyboardHeight
        if let activeTextField = activeTextField {
            vwScrollView.scrollRectToVisible(activeTextField.frame, animated: true)
        }
    }

    @objc func keyboardWillHide(_ notification: Notification) {
        // Reset scroll view content inset when keyboard hides
        vwScrollView.contentInset = .zero
        vwScrollView.contentOffset = .zero
    }
    
    // MARK: - Helper Methods
    
    /// Validates an email and password using regular expressions.
    ///
    /// - Parameters:
    ///   - email: The email address to be validated.
    ///   - password: The password to be validated.
    /// - Returns: A boolean value indicating whether the email and password are valid.
    func isValidEmailAndPassword(email: String, password: String) -> Bool {
        // Regular expression for email validation
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        
        // Regular expression for password validation
        // Password must contain at least 8 characters
        let passwordRegex = "^.{8,}$"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        
        if emailPredicate.evaluate(with: email) {
            // Email is valid, now check password
            if passwordPredicate.evaluate(with: password) {
                // Password is valid
                return true
            } else {
                // Password is invalid, show error message and focus on password field
                showValidationMessage(message: "Please enter at least 8 characters long password", color: "")
                txtPassword.becomeFirstResponder()
                return false
            }
        } else {
            // Email is invalid, show error message and focus on email field
            showValidationMessage(message: "Please enter a valid Email Address", color: "")
            txtEmail.becomeFirstResponder()
            return false
        }
    }

    
    /// Displays a validation message with animation.
    ///
    /// - Parameters:
    ///   - message: The message to be displayed.
    ///   - color: The color of the message text.
    func showValidationMessage(message: String, color: String) {
        // Determine text color
        var textColor: UIColor = .red
        if !color.isEmpty, let namedColor = UIColor(named: color) {
            textColor = namedColor
        }
        
        // Set label properties and animate its appearance
        lblError.textColor = textColor
        lblError.text = message
        UIView.animate(withDuration: 0.3) {
            self.lblErrorHeight.constant = 40
            self.view.layoutIfNeeded()
            self.vwScrollView.contentOffset = CGPoint(x: 0, y: self.vwScrollView.contentOffset.y - 40)
        }
        
        // Automatically hide the message after 3 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            UIView.animate(withDuration: 0.3) {
                self.lblErrorHeight.constant = 0
                self.view.layoutIfNeeded()
                self.vwScrollView.contentOffset = CGPoint(x: 0, y: self.vwScrollView.contentOffset.y + 40)
            }
        }
    }
    
    /// Hides the validation message with animation.
    func hideValidationMessage() {
        // Reset label text and animate its disappearance
        lblError.text = nil
        UIView.animate(withDuration: 0.3) {
            self.lblErrorHeight.constant = 0
            self.view.layoutIfNeeded()
        }
    }
    
}
