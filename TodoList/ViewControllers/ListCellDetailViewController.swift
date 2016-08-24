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
        
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func saveNewListItem() {
        let listItem = ListItem(title: "", description: "")
        var hasTitleOrDescriptionChanged = false
        
        
        if !titleTextField.text!.isEmpty {
            listItem.setTitle(titleTextField.text!)
            hasTitleOrDescriptionChanged = true
        }
        
        if !descriptionTextView.text!.isEmpty {
            listItem.setDescription(descriptionTextView.text!)
            hasTitleOrDescriptionChanged = true
        }
        
        if hasTitleOrDescriptionChanged {
            TodoListManager.sharedInstance.addToList(listItem)
        }
    }
    
    func updateListItem() {
        let updatedListItem = ListItem(title: titleTextField.text!, description: descriptionTextView.text!)
        TodoListManager.sharedInstance.updateListItem(updatedListItem, index: self.index!)
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
