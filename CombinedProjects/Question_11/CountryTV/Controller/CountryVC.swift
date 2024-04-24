//
//  CountryTVVC.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 15/04/24.
//

import UIKit

class CountryVC: UIViewController {    
    
    @IBOutlet weak var btnBack: UIButton!
    var arrSource = ["United States", "Canada", "United Kingdom", "Australia", "Germany", "France", "Japan", "Brazil", "India", "China"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func btnBackAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}

extension CountryVC:UITableViewDelegate,UITableViewDataSource{
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryNameTVC", for: indexPath)as! CountryNameTVC
        cell.configCell(data: arrSource[indexPath.row])
        return cell
    }
}

