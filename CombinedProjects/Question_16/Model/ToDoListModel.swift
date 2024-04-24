//
//  ToDoModel.swift
//  CombinedProjects
//
//  Created by Yug Mistry on 22/04/24.
//

import Foundation

class ToDoListModel:NSObject{
    var content: String!
    var isEditing: Bool!
    
    init(content: String,isEditing: Bool) {
        self.content = content
        self.isEditing = isEditing
    }
}
