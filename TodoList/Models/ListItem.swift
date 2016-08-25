//
//  ListItem.swift
//  TodoList
//
//  Created by Jason Salaber on 2016-08-22.
//  Copyright © 2016 Jason Salaber. All rights reserved.
//

import Foundation
import CoreData

class ListItem: NSManagedObject {
    
    @NSManaged private var noteTitle: String?
    @NSManaged private var noteDescription: String?
    
    // MARK: get functions
    
    func getTitle() -> String? {
        return noteTitle!
    }
    
    func getDescription() -> String? {
        return noteDescription!
    }
    
    // MARK: mutator functions
    
    func setTitleForNote(title: String) {
        self.noteTitle = title
    }
    
    func setDescription(description: String) {
        self.noteDescription = description
    }
    
}