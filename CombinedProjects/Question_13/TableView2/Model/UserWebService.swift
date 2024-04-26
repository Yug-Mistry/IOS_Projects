//
//  UserWebService.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 17/04/24.
//

import Foundation

// Class responsible for fetching user data from a web service
class UserWebService: NSObject {
    
    // MARK: - Methods
    
    /// Fetches user list from a web service and invokes a completion block with the fetched data
    /// - Parameter block: A closure to be executed upon completion, providing an array of UserModel objects
    func getUserList(block: @escaping ([UserModel]) -> Void) {
        var responseModel = [UserModel]()
        
        // URL string for the web service endpoint
        let urlString = "https://reqres.in/api/users?page=2"
        
        // Create a URL object from the string
        if let url = URL(string: urlString) {
            // Perform network request synchronously
            do {
                // Fetch data from the URL
                let data = try Data(contentsOf: url, options: .alwaysMapped)
                
                // Serialize JSON data
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                
                // Check if the JSON result is a dictionary
                if let jsonDict = jsonResult as? [String: Any] {
                    // Check if the "data" key contains an array of dictionaries
                    if let dataArray = jsonDict["data"] as? [[String: Any]] {
                        // Map the array of dictionaries to UserModel objects
                        responseModel = dataArray.map { UserModel(fromDictionary: $0) }
                        
                        // Call the completion block with the fetched data
                        block(responseModel)
                    } else {
                        print("Error: Unable to parse 'data' key")
                    }
                } else {
                    print("Error: Unable to parse JSON result as dictionary")
                }
            } catch {
                print("Error: Unable to parse JSON")
            }
        } else {
            print("Invalid URL")
        }
    }
}
