//
//  DetailViewController.swift
//  Contacts
//
//  Created by sarah on 2/17/18.
//  Copyright © 2018 sarah. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    var contact: Contact?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        if let contact = self.contact{
            if let name = contact.name {
                self.nameLabel.text=name
            }else{
                self.nameLabel.text = "There's no name. Please update information"
            }
            if let phoneNumber = contact.phoneNumber{
                self.phoneNumberLabel.text = phoneNumber
            }else{
                self.phoneNumberLabel.text = "There's no Phone Number. Please update information"            }
            
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
