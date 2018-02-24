//
//  Contact.swift
//  Contacts
//
//  Created by sarah on 2/10/18.
//  Copyright © 2018 sarah. All rights reserved.
//

import UIKit

class Contact: NSObject {
    var name: String?
    var phoneNumber: String?
    
    init(name:String? = nil, phoneNumber:String? = nil){
         super.init()
        self.name = name
        self.phoneNumber = phoneNumber
       
    }

}
