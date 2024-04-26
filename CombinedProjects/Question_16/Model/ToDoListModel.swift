//
//  ToDoModel.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 22/04/24.
//

import Foundation

/// Model representing a single ToDo item.
class ToDoListModel: NSObject {
    
    // MARK: - Properties
    
    /// Content of the ToDo item.
    var content: String!
    /// Flag indicating whether the ToDo item is currently being edited.
    var isEditing: Bool!
    
    // MARK: - Initializer
    
    /// Initializes a ToDoListModel object with the provided content and editing status.
    /// - Parameters:
    ///   - content: The content of the ToDo item.
    ///   - isEditing: A boolean flag indicating whether the item is currently being edited.
    init(content: String, isEditing: Bool) {
        self.content = content
        self.isEditing = isEditing
    }
}
