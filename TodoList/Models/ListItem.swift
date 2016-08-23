//
//  ListItem.swift
//  TodoList
//
//  Created by Jason Salaber on 2016-08-22.
//  Copyright © 2016 Jason Salaber. All rights reserved.
//

import Foundation

class ListItem {
    
    private var title: String
    private var description: String
    
    init(title: String, description: String) {
        self.title = title
        self.description = description
    }
    
    // MARK: get functions
    
    func getTitle() -> String {
        return title
    }
    
    func getDescription() -> String {
        return description
    }
    
    // MARK: mutator functions
    
    func setTitle(title: String) {
        self.title = title
    }
    
    func setDescription(description: String) {
        self.description = description
    }
    
}