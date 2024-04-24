//
//  UserSectionWebService.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 17/04/24.
//

import Foundation

class UserSectionWebService: NSObject {
    func getUserList(block: @escaping ([UserSectionModel]) -> Void) {
        var responseModel = [UserSectionModel]()
    
        let urlString = "https://reqres.in/api/users"
        
        if let url = URL(string: urlString) {
            // Create a URLSession object
            do {
                let data = try Data(contentsOf: url, options: .alwaysMapped)
                
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                
                // Check if the JSON result is a dictionary
                if let jsonDict = jsonResult as? [String: Any] {
                    // Check if the "data" key contains an array of dictionaries
                    if let dataArray = jsonDict["data"] as? [[String: Any]] {
                        // Map the array of dictionaries to UserModel objects
                        responseModel = dataArray.map { UserSectionModel(fromDictionary: $0) }
                        
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
