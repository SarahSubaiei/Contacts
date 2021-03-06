//
//  ContactsTableViewController.swift
//  Contacts
//
//  Created by sarah on 2/10/18.
//  Copyright © 2018 sarah. All rights reserved.
//

import UIKit

class ContactsTableViewController: UITableViewController {
    
    var contacts:[Contact] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let moveButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(ContactsTableViewController.toggleEdit))
        navigationItem.leftBarButtonItem = moveButton
        
        
        
        
        let jenny = Contact(phoneNumber: "867-5309")
        let rich = Contact(name:"Rich", phoneNumber: "888-888-8888")
        let mindy = Contact(name:"Mindy")
        
        self.contacts.append(jenny)
        self.contacts.append(rich)
        self.contacts.append(mindy)
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func toggleEdit() {
        tableView.setEditing(!tableView.isEditing, animated: true)
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return self.contacts.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
       let contact = self.contacts [indexPath.row]
       
        if let name = contact.name{
            cell.textLabel?.text = name
        }else{
        
        cell.textLabel?.text = "No Name"
        }
        return cell
    }
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        if tableView.isEditing{
            return.none
        }else{
            return.delete
        }
    }
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.contacts.remove(at: indexPath.row)
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
        
    }


    
    
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
let contactMoving = contacts.remove(at: fromIndexPath.row)
        contacts.insert(contactMoving, at: to.row)
    }
 

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    

 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
let indexPath = self.tableView.indexPath(for: sender as! UITableViewCell)!
        let contact = self.contacts[indexPath.row]
        let destination = segue.destination as! DetailViewController
        destination.contact = contact
}
}






