//
//  TodoListTableViewController.swift
//  TodoList
//
//  Created by Jason Salaber on 2016-08-22.
//  Copyright © 2016 Jason Salaber. All rights reserved.
//

import UIKit

class TodoListTableViewController: UITableViewController {
    
    static let title = "Todo List"
    
    var todoList: Array<String>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cellNib = UINib(nibName: TableViewConstants.todoListCell, bundle: nil)
        self.tableView?.registerNib(cellNib, forCellReuseIdentifier: TableViewConstants.todoListCellIdentifier)
        self.navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(transitionToListDetail))
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tableView?.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func getListCellDetailViewController() -> ListCellDetailViewController {
        return ListCellDetailViewController(nibName: String(ListCellDetailViewController), bundle: nil)
    }
    
    func transitionToListDetail() {
        
        let listCellDetailViewController = getListCellDetailViewController()
        self.navigationController?.pushViewController(listCellDetailViewController, animated: true)
        
    }
    
    func transitionToLIstDetailWithIndex(index: Int) {
        let listCellDetailViewController = getListCellDetailViewController()
        listCellDetailViewController.index = index
        self.navigationController?.pushViewController(listCellDetailViewController, animated: true)
        
    }
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return TodoListManager.sharedInstance.getTodoList().count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(TableViewConstants.todoListCellIdentifier, forIndexPath: indexPath)

        if let title = TodoListManager.sharedInstance.getTodoListItemAtIndex(indexPath.row)?.getTitle() {
            cell.textLabel!.text = title
        }
        
        return cell
    }
    

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
 
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        transitionToLIstDetailWithIndex(indexPath.row)
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
}
