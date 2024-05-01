//
//  NewsWebService.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 01/05/24.
//

import Foundation

class NewsWebService: NSObject {
    func getNewsList(block : ([NewsModel]) -> Swift.Void){
        var responsemodel =  [NewsModel]()
        let dict = readJsonFile(ofName: "newsJson")
        if let arr = dict["articles"] as? [[String : Any]]{
            responsemodel =  arr.map({ NewsModel(fromDictionary: $0)})
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
