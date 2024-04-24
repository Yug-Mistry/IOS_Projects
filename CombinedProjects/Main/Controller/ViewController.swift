//
//  ViewController.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 11/04/24.
//

import UIKit

// MARK: - Enum for Storyboard Names

enum StoryboardName: String {
    case helloWorld = "helloWorld"
    case login = "Login"
    case newsLogin = "NewsLogin"
    case screen1 = "Screen1"
    case screen2 = "Screen2"
    case screen3 = "Screen3"
    case colorChange = "ColorChange"
    case stack = "Stack"
    case multiStack = "MultiStack"
    case loginSmall = "LoginSmall"
    case countryTV = "CountryTV"
    case tableView2 = "TableView2"
    case jsonTV = "jsonTV"
}

class ViewController: UIViewController {
    
    // MARK: - Button Tags
    
    enum ButtonTag: Int {
        case helloWorld = 1
        case screen1
        case screen2
        case screen3
        case colorChange
        case stack
        case multiStack
        case loginSmall
        case silverTouchLogin
        case prasar
        case countryTV
        case tableView2
        case jsonTV
    }
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Button Actions
    
    @IBAction func buttonAction(_ sender: UIButton) {
        guard let tag = ButtonTag(rawValue: sender.tag) else {
            return
        }
        
        switch tag {
        case .helloWorld:
            instantiateViewController(fromStoryboard: .helloWorld, withIdentifier: "HelloVC")
        case .screen1:
            instantiateViewController(fromStoryboard: .screen1, withIdentifier: "Screen1VC")
        case .screen2:
            instantiateViewController(fromStoryboard: .screen2, withIdentifier: "Screen2VC")
        case .screen3:
            instantiateViewController(fromStoryboard: .screen3, withIdentifier: "Screen3VC")
        case .colorChange:
            instantiateViewController(fromStoryboard: .colorChange, withIdentifier: "ChangeColorViewController")
        case .stack:
            instantiateViewController(fromStoryboard: .stack, withIdentifier: "StackViewController")
        case .multiStack:
            instantiateViewController(fromStoryboard: .multiStack, withIdentifier: "MultiStackViewController")
        case .loginSmall:
            instantiateViewController(fromStoryboard: .loginSmall, withIdentifier: "LoginViewController")
        case .silverTouchLogin:
            instantiateViewController(fromStoryboard: .login, withIdentifier: "LoginVC")
        case .prasar:
            instantiateViewController(fromStoryboard: .newsLogin, withIdentifier: "NewsLoginVC")
        case .countryTV:
            instantiateViewController(fromStoryboard: .countryTV, withIdentifier: "CountryTVVC")
        case .tableView2:
            instantiateViewController(fromStoryboard: .tableView2, withIdentifier: "TableView2VC")
        case .jsonTV:
            instantiateViewController(fromStoryboard: .jsonTV, withIdentifier: "jsonTVVC")
        }
    }
    
}

// MARK: - Extension for UIViewController

extension UIViewController {
    
    /// Instantiates a view controller from a specified storyboard and pushes it onto the navigation stack.
    ///
    /// - Parameters:
    ///   - storyboardName: The name of the storyboard in Storyboard enum from which to instantiate the view controller.
    ///   - identifier: The identifier of the view controller to instantiate.
    func instantiateViewController(fromStoryboard storyboardName: StoryboardName, withIdentifier identifier: String) {
        let storyboard = UIStoryboard(name: storyboardName.rawValue, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: identifier)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
