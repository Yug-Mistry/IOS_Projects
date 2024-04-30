//
//  SideMenuDemoWebService.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 23/04/24.
//

import Foundation

/// Class responsible for fetching side menu item data from a demo web service.
class SideMenuItemDemoWebService: NSObject {
    
    /// Fetches the list of side menu items from the demo web service.
    /// - Parameter block: A closure to handle the list of side menu items.
    func getItemList(block: ([SideMenuItemModel]) -> Void) {
        var responseModel: [SideMenuItemModel] = []
        if let arr = readPropertyList(ofName: "SideMenu") as? [[String: Any]] {
            responseModel = arr.map { SideMenuItemModel(dict: $0) }
        }
        block(responseModel)
    }
    
    /// Reads a property list file.
    /// - Parameter ofName: The name of the property list file.
    /// - Returns: The contents of the property list file.
    func readPropertyList(ofName: String) -> Any? {
        if let path = Bundle.main.path(forResource: ofName, ofType: "plist") {
            do {
                let fileUrl = URL(fileURLWithPath: path)
                let data = try Data(contentsOf: fileUrl)
                let plistData = try PropertyListSerialization.propertyList(from: data, options: .mutableContainers, format: nil)
                return plistData
            } catch let error {
                debugPrint(error.localizedDescription)
            }
        }
        return nil
    }
}
