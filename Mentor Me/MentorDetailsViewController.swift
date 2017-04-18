//
//  MentorDetailsViewController.swift
//  Mentor Me
//
//  Created by Meghan Magee on 4/17/17.
//  Copyright © 2017 Prarthana Neotia. All rights reserved.
//

import UIKit
import CoreData

class MentorDetailsViewController: UIViewController {
    
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var majorLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var adviceTypeLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    var firstNameStr:String = ""
    var lastNameStr:String = ""
    var majorStr:String = ""
    var yearStr:String = ""
    var adviceTypeStr:String = ""
    var emailStr:String = ""
    var phoneStr:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Mentor Details"

        // Do any additional setup after loading the view.
        firstNameLabel.text = firstNameStr
        lastNameLabel.text = lastNameStr
        majorLabel.text = majorStr
        yearLabel.text = yearStr
        adviceTypeLabel.text = adviceTypeStr
        emailLabel.text = emailStr
        phoneLabel.text = phoneStr
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
