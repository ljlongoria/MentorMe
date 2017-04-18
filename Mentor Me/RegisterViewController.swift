//
//  PeopleTableViewController.swift
//  TestCoreData3
//
//  Created by Robert Seitsinger on 2/25/17.
//  Copyright © 2017 cs378. All rights reserved.
//

import UIKit
import CoreData

class RegisterViewController: UIViewController {
    
    var people = [NSManagedObject]()
    var accountType: Int32?
    
    override func viewDidLoad() {
        self.changeBackground()
        super.viewDidLoad()
        
        // Set the nav bar title
        self.title = "Register"
        
        //add user
        //savePerson(username: "mentor", password: "mentor123", accountType: 0)
        //savePerson(username: "mentee", password: "mentee123", accountType: 1)
        //savePerson(username: "mentorTest", password: "m123", firstName: "", lastName: "", phone: "", email: "mentortest@mm.com", description: "", adviceType: "", major: "", year: "", accountType: 0)
        
        // Load the people array - to get data previously stored.
        loadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    var emailTextField: UITextField? = nil
    var usernameTextField: UITextField? = nil
    var passwordTextField: UITextField? = nil

    @IBAction func MentorSelected(_ sender: Any) {
        
       //Alert view asks for the mentor's username and password and stores it to core data
        let alert = UIAlertController(title: "New Mentor",
                                      message: "Register Yourself",
                                      preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Save",
                                       style: .default) { (action: UIAlertAction!) -> Void in
                                        let emailTextField = alert.textFields![0]
                                        let usernameTextField = alert.textFields![1]
                                        let passwordTextField = alert.textFields![2]
                                        self.savePerson(username: usernameTextField.text!, password: passwordTextField.text!, firstName: "", lastName: "", phone: "", email: emailTextField.text!, adviceType: "", major: "", year: "", accountType: 0)
                                       // self.tableView.reloadData()  // causes the table data source methods to execute
        }
        
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .default) { (action: UIAlertAction!) -> Void in
        }
    
        alert.addTextField { (textField) -> Void in
            self.emailTextField = textField
            self.emailTextField?.placeholder = "Email"
        }
        alert.addTextField { (textField) -> Void in
            self.usernameTextField = textField
            self.usernameTextField?.placeholder = "Username"
        }
        alert.addTextField { (textField) -> Void in
            self.passwordTextField = textField
            self.passwordTextField?.placeholder = "Password"
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert,
                animated: true,
                completion: nil)
    
        //update account type
        accountType = 0
    }
    
    @IBAction func MenteeSelected(_ sender: Any) {
        
        //Alert view asks for the mentor's username and password and stores it to core data
        let alert = UIAlertController(title: "New Mentee",
                                      message: "Register Yourself",
                                      preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Save",
                                       style: .default) { (action: UIAlertAction!) -> Void in
                                        let emailTextField = alert.textFields![0]
                                        let usernameTextField = alert.textFields![1]
                                        let passwordTextField = alert.textFields![2]
                                        self.savePerson(username: usernameTextField.text!, password: passwordTextField.text!, firstName: "", lastName: "", phone: "", email: emailTextField.text!, adviceType: "", major: "", year: "", accountType: 1)
                                        // self.tableView.reloadData()  // causes the table data source methods to execute
        }
        
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .default) { (action: UIAlertAction!) -> Void in
        }
        
        
        alert.addTextField { (textField) -> Void in
            self.emailTextField = textField
            self.emailTextField?.placeholder = "Email"
        }
        alert.addTextField { (textField) -> Void in
            self.usernameTextField = textField
            self.usernameTextField?.placeholder = "Username"
        }
        alert.addTextField { (textField) -> Void in
            self.passwordTextField = textField
            self.passwordTextField?.placeholder = "Password"
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert,
                animated: true,
                completion: nil)
        
        //update account type
        accountType = 1
        
    }
    
    fileprivate func savePerson(username: String, password: String, firstName: String, lastName: String, phone: String, email: String, adviceType: String, major: String, year: String, accountType: Int32){
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        // Create the entity we want to save
        let entity =  NSEntityDescription.entity(forEntityName: "Entity", in: managedContext)
        
        let user = NSManagedObject(entity: entity!, insertInto: managedContext)
        
        // Set the attribute values
        user.setValue(email, forKey: "email")
        user.setValue(username, forKey: "username")
        user.setValue(password, forKey: "password")
        user.setValue(accountType, forKey: "accountType")
        
        // Commit the changes.
        do {
            try managedContext.save()
        } catch {
            // what to do if an error occurs?
            let nserror = error as NSError
            print("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
        
        // Add the new entity to our array of managed objects
        people.append(user)
        print("User saved")
    }
    
    fileprivate func loadData() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:"Entity")
        
        var fetchedResults:[NSManagedObject]? = nil
        
        do {
            try fetchedResults = managedContext.fetch(fetchRequest) as? [NSManagedObject]
        } catch {
            // what to do if an error occurs?
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
        
        if let results = fetchedResults {
            people = results
        } else {
            print("Could not fetch")
        }
    }
    
    @IBAction func sendUserBeyongRegistration(_ sender: Any) {
        
        if accountType == 0 { //send mentor to Confirmation screen
            performSegue(withIdentifier: "confirmMentor", sender: self)
            
        } else { //send mentee to Edit Profile screen
            performSegue(withIdentifier: "confirmMenteeToEditProfile", sender: self)
        }
    }
    public func changeBackground() {
        let defaults = UserDefaults.standard
        let bgColor = defaults.string(forKey: "backgroundColor")
        //Hexadecimal codes
        // Blue - #A2E8FF
        // Yellow - #FFF99B
        // Purple - #E9CCFF
        
        var colors : [String:UIColor] = ["#E9CCFF":UIColor(red:0.91, green:0.80, blue:1.00, alpha:1.0),"#FFF99B":UIColor(red:1.00, green:0.98, blue:0.61, alpha:1.0),"#A2E8FF": UIColor(red:0.64, green:0.91, blue:1.00, alpha:1.0)]
        
        if (bgColor != nil) {
            self.view.backgroundColor = colors[String(describing: bgColor!)]
            
        }
    }

}
