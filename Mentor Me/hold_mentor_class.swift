//
//  hold_mentor_class.swift
//  Mentor Me
//
//  Created by Prarthana Neotia on 4/17/17.
//  Copyright © 2017 Prarthana Neotia. All rights reserved.
//

import Foundation



class hold_mentor {
    
    var firstName: String? = ""
    var lastName: String? = ""
    var email: String? = ""
    var phone: String? = ""
    var year: String? = ""
    var major: String? = ""
    var adviceType: String? = ""
    
    
    init (firstName: String?, lastName: String?, email: String?, phone:String?, year: String?, major: String?, adviceType:String?) {
    
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.phone = phone
        self.year = year
        self.major = major
        self.adviceType = adviceType
        
    }
    
}


