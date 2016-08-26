//
//  ListCellDetailViewController.swift
//  TodoList
//
//  Created by Jason Salaber on 2016-08-22.
//  Copyright © 2016 Jason Salaber. All rights reserved.
//

import UIKit

class ListCellDetailViewController: UIViewController {
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var descriptionTextView: UITextView!
    
    var index: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // replace default back button to trigger other methods when pressing back
        self.navigationItem.hidesBackButton = true
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Done, target: self, action: #selector(backPressed))
        
        if self.index != nil {
            
            if let title = TodoListManager.sharedInstance.getTodoListItemAtIndex(self.index!)?.getTitle() {
                self.titleTextField.text = title
            }
            
            if let description = TodoListManager.sharedInstance.getTodoListItemAtIndex(self.index!)?.getDescription() {
                self.descriptionTextView.text = description
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func backPressed() {
        
        if self.index == nil {
            saveNewListItem()
        } else {
            updateListItem()
        }
        
        CoreDataManager.sharedInstance.saveContext()
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func saveNewListItem() {
        
        var hasTitleOrDescriptionChanged = false
        var title: String?
        var description: String?
        
        if !titleTextField.text!.isEmpty {
            title = titleTextField.text!
            hasTitleOrDescriptionChanged = true
        }
        
        if !descriptionTextView.text!.isEmpty {
            description = descriptionTextView.text!
            hasTitleOrDescriptionChanged = true
        }
        
        if hasTitleOrDescriptionChanged {
            
            if let listItemEntity = CoreDataManager.sharedInstance.createEntity(String(ListItem)) {
                let listItem = CoreDataManager.sharedInstance.createManagedObject(listItemEntity) as! ListItem
                
                if title != nil {
                    listItem.setTitleForNote(title!)
                }
                
                if description != nil {
                    listItem.setDescription(description!)
                }
                
                TodoListManager.sharedInstance.addToList(listItem)
            }
            
        }
    }
    
    func updateListItem() {
        let listItem = TodoListManager.sharedInstance.getTodoListItemAtIndex(self.index!)
        listItem?.setTitleForNote(titleTextField.text!)
        listItem?.setDescription(descriptionTextView.text!)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
