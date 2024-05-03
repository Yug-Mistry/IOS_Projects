//
//  NewsWebService.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 01/05/24.
//

import Foundation

/// Class responsible for fetching news data from a web service or local JSON file
class NewsWebService: NSObject {
    
    /// Fetches the list of news articles from the web service or local JSON file
    /// - Parameter block: Completion block returning an array of NewsModel objects
    func getNewsList(block: @escaping ([NewsModel]) -> Void) {
        var responseModel = [NewsModel]()
        let dict = readJsonFile(ofName: "newsJson")
        if let arr = dict["articles"] as? [[String: Any]] {
            responseModel = arr.map({ NewsModel(fromDictionary: $0) })
        }
        block(responseModel)
    }
    
    /// Reads a JSON file from the app's bundle
    /// - Parameter ofName: Name of the JSON file (excluding the file extension)
    /// - Returns: Dictionary containing the JSON data
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
