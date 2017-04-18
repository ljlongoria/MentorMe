//
//  File.swift
//  Mentor Me
//
//  Created by Prarthana Neotia on 4/10/17.
//  Copyright © 2017 Prarthana Neotia. All rights reserved.
//

import Foundation
import UIKit

class Appearance {
    static var color : Int32 = 0
    
    class func setMyCustomLabelColor(color : Int32){
        //MyCustomLabel.appearance().textColor = Config.myCustomLabelColor
        //Config.changeColor(color: color)
        var myCustomLabelColor = UIColor.blue
        
        if color == 1 {
            myCustomLabelColor = UIColor.red
        } else if color == 2 {
            myCustomLabelColor = UIColor.blue
        } else if color == 3 {
            myCustomLabelColor = UIColor.black
        }
        
        UILabel.appearance().textColor = myCustomLabelColor
    }
}
