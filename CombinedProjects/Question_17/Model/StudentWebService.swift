//
//  StudentWebService.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 29/04/24.
//

import Foundation

// MARK: - StudentWebService

class StudentWebService: NSObject {
    
    // MARK: - Methods
    
    /// Fetches the list of students from a JSON file and passes the result to the completion block.
    /// - Parameter block: A closure that takes an array of StudentModel as its parameter.
    func getStudentList(block: ([StudentModel]) -> Void) {
        var responseModel = [StudentModel]()
        let dict = readJsonFile(ofName: "studentList")
        if let arr = dict["StudentList"] as? [[String: Any]] {
            responseModel = arr.map { StudentModel(fromDictionary: $0) }
        }
        block(responseModel)
    }
    
    /// Reads a JSON file from the bundle and returns its contents as a dictionary.
    /// - Parameter ofName: The name of the JSON file (excluding the file extension).
    /// - Returns: A dictionary containing the contents of the JSON file, or an empty dictionary if the file is not found or cannot be parsed.
    func readJsonFile(ofName: String) -> [String: Any] {
        guard let strPath = Bundle.main.path(forResource: ofName, ofType: ".json") else {
            return [:]
        }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: strPath), options: .alwaysMapped)
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
            if let dictJson = jsonResult as? [String: Any] {
                return dictJson
            }
        } catch {
            print("Error!! Unable to parse")
        }
        return [:]
    }
}
