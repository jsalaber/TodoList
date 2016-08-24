//
//  File.swift
//  TodoList
//
//  Created by Jason Salaber on 2016-08-22.
//  Copyright © 2016 Jason Salaber. All rights reserved.
//

import Foundation

class TodoListManager {
    
    static let sharedInstance = TodoListManager()
    private var todoList: Array<ListItem> = Array()
    
    private init() {}
    
    // MARK: get functions
    
    func getTodoList() -> Array<ListItem> {
        return todoList
    }
    
    func getTodoListItemAtIndex(index: Int) -> ListItem? {
        return todoList[index]
    }
    
    // MARK: mutating functions
    
    func addToList(item: ListItem) {
        todoList.append(item)
    }
    
    func updateListItem(updatedItem: ListItem, index: Int) {
        if index < self.todoList.count {
            self.todoList[index] = updatedItem
        }
    }
    
}