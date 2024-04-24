//
//  SideMenuModel.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 23/04/24.
//

import Foundation


class SideMenuItemModel : NSObject {
    var TitleKey:String!
    let storyboardID:String!
    let viewControllerName:String!
    let Image:String!
    var expanded : Bool!
    
    
    enum keys: String {
        case TitleKey
        case storyboardID
        case viewControllerName
        case Image
        case expanded
        
    }
    init(dict : [String:Any]){
        self.TitleKey = dict[keys.TitleKey.rawValue] as? String ?? ""
        self.storyboardID = dict[keys.storyboardID.rawValue] as? String ?? ""
        self.viewControllerName = dict[keys.viewControllerName.rawValue] as? String ?? ""
        self.Image = dict[keys.Image.rawValue] as? String ?? ""
        self.expanded = false
    }
}
