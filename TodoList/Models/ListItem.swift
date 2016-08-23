//
//  ListItem.swift
//  TodoList
//
//  Created by Jason Salaber on 2016-08-22.
//  Copyright © 2016 Jason Salaber. All rights reserved.
//

import Foundation

class ListItem {
    
    var title: String
    var description: String
    
    init(title: String, description: String) {
        self.title = title
        self.description = description
    }
    
    func getTitle() -> String {
        return title
    }
    
    func getDescription() -> String {
        return description
    }
    
}