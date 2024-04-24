//
//  ProjectModel.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 18/04/24.
//

import Foundation

class ProjectModel{
    var title:String!
    var storyboardName:String!
    var viewControllerName:String!
    
    init(fromDictionary dictionary : [String : Any]){
           title = dictionary["title"] as? String
           storyboardName = dictionary["storyboardName"] as? String
           viewControllerName = dictionary["viewControllerName"] as? String
       }
}
