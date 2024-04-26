//
//  UserSectionModel.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 16/04/24.
//

import Foundation
class UserSectionModel : NSObject {
    
    // MARK: - Properties
    
    var id: String!
    var email: String!
    var fname: String!
    var lname: String!
    var imgAvatar: String!
    
    // MARK: - Initializer
    
    /// Initializes a UserModel object from a dictionary containing user data
    /// - Parameter dictionary: The dictionary containing user data where key is string and data can be of any type
    init(fromDictionary dictionary: [String: Any]) {
        id = dictionary["id"] as? String
        email = dictionary["email"] as? String
        fname = dictionary["first_name"] as? String
        lname = dictionary["last_name"] as? String
        imgAvatar = dictionary["avatar"] as? String
    }
}
