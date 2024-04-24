//
//  UserModel.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 16/04/24.
//

import Foundation
class UserModel : NSObject{
    var id:String!
    var email : String!
    var fname : String!
    var lname : String!
    var imgAvatar : String!
    
    init(fromDictionary dictionary : [String : Any]){
        id = dictionary["id"] as? String
        email = dictionary["email"] as? String
        fname = dictionary["first_name"] as? String
        lname = dictionary["last_name"] as? String
        imgAvatar = dictionary["avatar"] as? String
    }
}
