//
//  ProjectWebService.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 22/04/24.
//

import Foundation

class ProjectWebService: NSObject {
    func getProjectList(block : ([ProjectModel]) -> Swift.Void){
        var responsemodel =  [ProjectModel]()
        let dict = readJsonFile(ofName: "projectList")
        if let arr = dict["ProjectList"] as? [[String : Any]]{
            responsemodel =  arr.map({ ProjectModel(fromDictionary: $0)})
        }
        block(responsemodel)
    }
    
    func readJsonFile(ofName: String) -> [String : Any] {
        guard let strPath = Bundle.main.path(forResource: ofName, ofType: ".json") else {
            return [:]
        }
        do {
          
            let data = try Data(contentsOf: URL(fileURLWithPath: strPath), options: .alwaysMapped)
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
            if let dictJson = jsonResult as? [String : Any] {
                return dictJson
            }
        } catch {
            print("Error!! Unable to parse")
        }
        return [:]
    }
}
