//
//  SideMenuDemoWebService.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 23/04/24.
//

import Foundation

class SideMenuItemDemoWebService: NSObject {
    func getItemList(block : ([SideMenuItemModel]) -> Swift.Void){
        var responseModel: [SideMenuItemModel] = []
        if let arr = readPropertyList(ofName: "SideMenu") as? [[String:Any]] {
            responseModel = arr.map({ SideMenuItemModel(dict: $0) })
        }
        block(responseModel)
        
    }
    
    func readPropertyList(ofName: String) -> Any? {
        if let path = Bundle.main.path(forResource: ofName, ofType: "plist") {
            do {
                let fileUrl = URL(fileURLWithPath: path)
                let data = try Data(contentsOf: fileUrl, options: .init(rawValue: 0))
                let plistData = try PropertyListSerialization.propertyList(from: data, options: .mutableContainers, format: nil)
                return plistData
            } catch let error {
                debugPrint(error.localizedDescription)
            }
        }
        return nil
    }
}
