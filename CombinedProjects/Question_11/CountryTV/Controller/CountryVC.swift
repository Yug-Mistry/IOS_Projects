//
//  CountryTVVC.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 15/04/24.
//

import UIKit

// View Controller responsible for displaying a list of countries
class CountryVC: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var btnBack: UIButton!
    
    // Array containing country names as data source
    var arrSource = ["United States", "Canada", "United Kingdom", "Australia", "Germany", "France", "Japan", "Brazil", "India", "China"]
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Additional setup after loading the view
    }
    
    // MARK: - Button Action
    
    // Action triggered when the back button is tapped
    @IBAction func btnBackAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - TableView DataSource & Delegate

extension CountryVC: UITableViewDelegate, UITableViewDataSource {
    
    // Returns the number of rows in the table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrSource.count
    }
    
    // Configures and returns a table view cell for the specified row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryNameTVC", for: indexPath) as! CountryNameTVC
        cell.configCell(data: arrSource[indexPath.row])
        return cell
    }
}
