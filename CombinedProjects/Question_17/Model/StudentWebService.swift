//
//  StudentWebService.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 29/04/24.
//

import Foundation

class StudentWebService: NSObject {
    func getStudentList(block : ([StudentModel]) -> Swift.Void){
        var responsemodel =  [StudentModel]()
        let dict = readJsonFile(ofName: "studentList")
        if let arr = dict["StudentList"] as? [[String : Any]]{
            responsemodel =  arr.map({ StudentModel(fromDictionary: $0)})
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
