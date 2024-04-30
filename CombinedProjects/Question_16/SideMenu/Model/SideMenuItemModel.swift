//
//  SideMenuModel.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 23/04/24.
//

import Foundation

/// Model class representing a side menu item.
class SideMenuItemModel: NSObject {
    
    // MARK: - Properties
    
    /// The title key for the side menu item.
    var TitleKey: String!
    /// The storyboard ID for the view controller associated with the side menu item.
    let storyboardID: String!
    /// The name of the view controller associated with the side menu item.
    let viewControllerName: String!
    /// The image name for the side menu item.
    let Image: String!
    /// Boolean indicating whether the side menu item is expanded.
    var expanded: Bool!
    
    // MARK: - Enum
    
    /// Enum defining keys for accessing data in the dictionary.
    enum Keys: String {
        case TitleKey
        case storyboardID
        case viewControllerName
        case Image
        case expanded
    }
    
    // MARK: - Initialization
    
    /// Initializes a SideMenuItemModel object with the provided dictionary.
    /// - Parameter dict: The dictionary containing the data for the side menu item.
    init(dict: [String: Any]) {
        self.TitleKey = dict[Keys.TitleKey.rawValue] as? String ?? ""
        self.storyboardID = dict[Keys.storyboardID.rawValue] as? String ?? ""
        self.viewControllerName = dict[Keys.viewControllerName.rawValue] as? String ?? ""
        self.Image = dict[Keys.Image.rawValue] as? String ?? ""
        self.expanded = false
    }
}
