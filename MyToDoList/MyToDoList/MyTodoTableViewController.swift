//
//  MyTodoTableViewController.swift
//  MyToDoList
//
//  Created by kw9w on 10/18/21.
//

import UIKit

class MyTodoTableViewController: UITableViewController {
    
    var items: [TodoItem] = [
        TodoItem(title: "IOS HW 01", isChecked: false),
        TodoItem(title: "Take a nap", isChecked: false),
        TodoItem(title: "Check emails", isChecked: true)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath) as! MyTodoTableViewCell

        // Configure the cell...
        let item = items[indexPath.row]
        cell.title.text! = item.title
        if item.isChecked{
            cell.status.text! = "☑️"
        }
        else{
            cell.status.text! = " "
        }
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        items.remove(at: indexPath.row)
        self.tableView.deleteRows(at: [indexPath], with: .automatic)
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "addItem" {
            let addItemViewController = segue.destination as! ItemViewController
            addItemViewController.addItemDelegate = self
        }
        else if segue.identifier == "editItem" {
            let editItemViewController = segue.destination as! ItemViewController
            let cell = sender as! MyTodoTableViewCell
            var isChecked: Bool
            if cell.status.text! == "☑️" {
                isChecked = true
            }
            else {
                isChecked = false
            }
            let item = TodoItem(title: cell.title.text!, isChecked: isChecked)
            editItemViewController.itemToEdit = item
            editItemViewController.itemIndex = tableView.indexPath(for: cell)!.row
            editItemViewController.editItemDelegate = self
        }
    }
    

}

extension MyTodoTableViewController: AddItemDelegate {
    func addItem(item: TodoItem) {
        self.items.append(item)
        self.tableView.reloadData()
    }
    
    
}

extension MyTodoTableViewController: EditItemDelegate {
    func editItem(newItem: TodoItem, itemIndex: Int) {
        self.items[itemIndex] = newItem
        self.tableView.reloadData()
    }
}
