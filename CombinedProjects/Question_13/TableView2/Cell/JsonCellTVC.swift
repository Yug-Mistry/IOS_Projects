//
//  JsonCellTVC.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 17/04/24.
//

import UIKit

/// UITableViewCell subclass for displaying user data fetched from JSON
class JsonCellTVC: UITableViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var imgVW: UIImageView!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblFName: UILabel!
    @IBOutlet weak var lblLName: UILabel!
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Configuration Method
    
    /// Configure the cell with user data
    /// - Parameter data: The UserModel object containing user data
    func configCell(data: UserModel){
        lblEmail.text = data.email
        lblFName.text = data.fname
        lblLName.text = data.lname
        imgVW.fetchImage(from: data.imgAvatar)
        
        imgVW.layer.cornerRadius = imgVW.frame.height/2.2
        imgVW.layer.borderWidth = 1
        imgVW.layer.masksToBounds = true
        imgVW.layer.borderColor = UIColor.blue.cgColor
        imgVW.contentMode = .scaleAspectFill
    }
    
}

/// Extension to UIImageView to fetch and set image asynchronously from URL
extension UIImageView {
    
    /// Fetches and sets the image asynchronously from the specified URL
    /// - Parameter urlString: The URL string from which to fetch the image
    func fetchImage(from urlString: String) {
        UIImage.fetchImage(from: urlString) { [weak self] (image) in
            DispatchQueue.main.async {
                self?.image = image
            }
        }
    }
}

/// Extension to UIImage to fetch image asynchronously from URL
extension UIImage {
    
    /// Fetches an image asynchronously from the specified URL
    /// - Parameters:
    ///   - urlString: The URL string from which to fetch the image
    ///   - completion: The completion handler returning the fetched image or nil if unsuccessful
    static func fetchImage(from urlString: String, completion: @escaping (UIImage?) -> Void) {
        // Create a URL object from the string
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        // Create a URLSession object
        let session = URLSession.shared
        
        // Create a data task with the URL
        let task = session.dataTask(with: url) { (data, response, error) in
            // Check for errors
            if let error = error {
                print("Error downloading image: \(error)")
                completion(nil)
                return
            }
            
            // Check if data is available
            guard let imageData = data else {
                print("No image data received")
                completion(nil)
                return
            }
            
            // Create UIImage from data
            if let image = UIImage(data: imageData) {
                completion(image)
            } else {
                completion(nil)
            }
        }
        
        // Start the data task
        task.resume()
    }
}
