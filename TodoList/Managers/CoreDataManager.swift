//
//  CoreDataManager.swift
//  TodoList
//
//  Created by Jason Salaber on 2016-08-26.
//  Copyright © 2016 Jason Salaber. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class CoreDataManager {
    
    static let sharedInstance = CoreDataManager()
    var managedObjectContext: NSManagedObjectContext?
    
    private init() { }
    
    private func getManagedObjectContext() -> NSManagedObjectContext {
        if managedObjectContext == nil {
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            self.managedObjectContext = appDelegate.managedObjectContext
        }
        return self.managedObjectContext!
    }
    
    func createEntity(name: String) -> NSEntityDescription? {
        if let entity = NSEntityDescription.entityForName(name, inManagedObjectContext: getManagedObjectContext()) {
            return entity
        }
        
        // error creating entity
        return nil
        
    }
    
    func createManagedObject(entity: NSEntityDescription) -> NSManagedObject {
        return NSManagedObject(entity: entity, insertIntoManagedObjectContext: getManagedObjectContext())
    }
    
    func saveContext() {
        do {
            try getManagedObjectContext().save()
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    func runFetchRequest(entity: String) -> [AnyObject]? {
        let fetchRequest = NSFetchRequest(entityName: entity)
        
        do {
            let results = try getManagedObjectContext().executeFetchRequest(fetchRequest)
            return results
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
            return nil
        }
        
    }
    
    func deleteManagedObject(object: NSManagedObject) {
        getManagedObjectContext().deleteObject(object)
        saveContext()
    }
    
}