//
//  MainHomePageViewController.swift
//  Mentor Me
//
//  Created by Meghan Magee on 3/23/17.
//  Copyright © 2017 Prarthana Neotia. All rights reserved.
//

import UIKit
import CoreData

class MainHomePageViewController: UIViewController {

    var people = [NSManagedObject]()
    
    override func viewDidLoad() {
        self.changeBackground()
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //add user
        //savePerson(username: "mentor", password: "mentor123", accountType: 0)
        //savePerson(username: "mentee", password: "mentee123", accountType: 1)
        //savePerson(username: "mentorTest", password: "m123", firstName: "", lastName: "", phone: "", email: "mentortest@mm.com", description: "", adviceType: "", major: "", year: "", accountType: 0)
        savePerson(username: "as95", password: "winner", firstName: "Adam", lastName:  "Sandler", phone: "2819456793", email: "asandler@hotmail.com", adviceType: "career",  major: "english", year: "freshman", accountType: 1)
        savePerson(username: "pn45", password: "longhorn", firstName: "Prar", lastName: "Neotia", phone: "4945387774", email: "prar@gmail.com",  adviceType: "academics",  major: "biology", year: "junior", accountType: 1)
        savePerson(username: "mm74", password: "orange", firstName: "Meghan", lastName: "Magee", phone:
            "2816479283", email: "mmag@hotmail.com", adviceType: "career",  major: "math", year: "senior", accountType: 1)
        savePerson(username: "ll73", password: "flags", firstName: "Lindsey", lastName: "Longoria", phone: "6389470003", email: "longoria@hotmail.com", adviceType: "academics",  major: "finance", year: "sophomore", accountType: 1)
        savePerson(username: "bb982", password: "password1", firstName: "Bob", lastName: "Bass", phone: "7360007384", email: "bbass@gmail.com", adviceType: "career",  major: "biology", year: "sophomore", accountType: 1)
        savePerson(username: "th73", password: "cows", firstName: "Tessa", lastName: "Torres", phone: "7369994759", email: "torres@yahoo.com", adviceType: "career",  major: "finance", year: "freshman", accountType: 1)
        savePerson(username: "sb64", password: "passerby", firstName: "Scott", lastName: "Bailey", phone: "7369479936", email: "sbailey@gmail.com", adviceType: "career",  major: "biology", year: "senior", accountType: 1)
        savePerson(username: "mm876", password: "longhorn", firstName: "Maurice", lastName: "Mansfield", phone: "8364979874", email: "mmans@hotmail.com", adviceType: "career",  major: "english", year: "freshman", accountType: 1)
        savePerson(username: "ab876", password: "flagpass", firstName: "Abby", lastName: "Bailey", phone: "8766548756", email: "abailey@yahoo.com", adviceType: "academics",  major: "math", year: "freshman", accountType: 1)
        savePerson(username: "to87", password: "wordpress", firstName: "Teresa", lastName: "Obstfeld", phone: "8762384928", email: "tobs@hotmail.com", adviceType: "career",  major: "math", year: "sophomore", accountType: 1)
        
        // Load the people array - to get data previously stored.
        loadData()
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
        user.setValue(firstName, forKey: "firstName")
        user.setValue(lastName, forKey: "lastName")
        user.setValue(year, forKey: "year")
        user.setValue(adviceType, forKey: "adviceType")
        user.setValue(phone, forKey: "phone")
       // user.setValue(description, forKey: "description")
        user.setValue(major, forKey: "major")
        
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
