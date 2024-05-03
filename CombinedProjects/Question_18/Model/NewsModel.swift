//
//  NewsModel.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 01/05/24.
//

import Foundation

/// Model class representing a news article
class NewsModel: NSObject {
    var id: String
    var author: String
    var title: String
    var category: String
    var url: String
    var urlToImage: String
    var publishedAt: String
    var content: String
    var minRead: Int
    var isBookmarked: Bool
    
    /// Initializes a NewsModel object from a dictionary
    /// - Parameter dictionary: Dictionary containing the news article data
    init(fromDictionary dictionary: [String: Any]) {
        id = dictionary["id"] as? String ?? "-1"
        author = dictionary["author"] as? String ?? ""
        title = dictionary["title"] as? String ?? ""
        category = dictionary["category"] as? String ?? ""
        url = dictionary["url"] as? String ?? ""
        urlToImage = dictionary["urlToImage"] as? String ?? ""
        
        // Format the publishedAt date string
        if let dateString = dictionary["publishedAt"] as? String,
           let date = ISO8601DateFormatter().date(from: dateString) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM dd, yyyy"
            publishedAt = dateFormatter.string(from: date)
        } else {
            // Set default date if parsing fails
            publishedAt = "Jan 01, 2024"
        }
        
        content = dictionary["content"] as? String ?? ""
        // Calculate estimated reading time
        minRead = content.split(separator: " ").count / 10
        isBookmarked = false
    }
}
