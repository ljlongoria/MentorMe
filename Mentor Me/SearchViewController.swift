//
//  SearchViewController.swift
//  Mentor Me
//
//  Created by Prarthana Neotia on 4/17/17.
//  Copyright © 2017 Prarthana Neotia. All rights reserved.
//

import UIKit
import CoreData

//ADD MEGHAN'S SETTINGS CODE

//var temp:hold_mentor = hold_mentor(firstName: "init", lastName: <#String?#>)
var array = [hold_mentor]()
var final_mentors = [hold_mentor]()


class SearchViewController: UIViewController {

    @IBOutlet weak var english_button_outlet: UIButton!
    @IBOutlet weak var math_button_outlet: UIButton!
    @IBOutlet weak var finance_button_outlet: UIButton!
    @IBOutlet weak var biology_button_outlet: UIButton!
    
    
    var resultsArray = [NSManagedObject]()
    override func viewDidLoad() {
        super.viewDidLoad()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:"Entity")
        var fetchedResults: [NSManagedObject]? = nil
        var fetchedUsers: [NSManagedObject]? = nil

        var foundUserCount: Int32 = 0;
        
        //fetch declarations
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        
        
        //try to fetch - if no results, give error
        do {
            try fetchedResults = managedContext.fetch(fetchRequest) as? [NSManagedObject]
        } catch {
            // what to do if an error occurs?
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
        
        
        //save fetch results - if no results, give error
        if let results = fetchedResults {
            fetchedUsers = results
            print ("fetchedusers")
            print(fetchedUsers)
            
        } else {
            print("Could not fetch - does not exist")
        }
        
        
        for user in fetchedUsers! {
            if foundUserCount == 0 {
            
            let actualfirstName: String = user.value(forKey: "firstName") as! String
            print("avtualfn", actualfirstName)
//            print(temp)
//            temp!.firstName = actualfirstName
            let actuallastName: String = user.value(forKey: "lastName") as! String
//            temp!.lastName = actuallastName
            let actualMajor: String = user.value(forKey: "major") as! String
//            temp!.major = actualMajor
            let actualYear: String = user.value(forKey: "year") as! String
//            temp!.year = actualYear
            let actualAdviceType: String = user.value(forKey: "adviceType") as! String
//            temp!.adviceType = actualAdviceType
            let actualphone: String = user.value(forKey: "phone") as! String
//            temp!.phone = actualphone
       
            let actualemail: String = user.value(forKey: "email") as! String
//            temp?.email = actualemail
//            print ("temp", temp)
            
            let temp = hold_mentor(firstName: actualfirstName, lastName: actuallastName, email: actualemail, phone: actualphone, year: actualYear, major: actualMajor, adviceType: actualAdviceType)
            array.append(temp)
            print ("array.count",array.count)
            
            }
            
        
        // Do any additional setup after loading the view.
    }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Search_Button_Clicked(_ sender: Any) {
        
      
             //loop through users to find matching username and password
        //LLTODO - Stop for loop when user is found ; try while loop and counter?
        //var foundUser: Bool = false
     
        
      
      
                
               /*
                if txtUsername.text == actualUsername && txtPassword.text == actualPassword { //check if both username and password stored in Core Data match given input
                    let accountTypeNumber: Int32 = user.value(forKey: "accountType") as! Int32
                    
                    //reference: YouTube user The Swift Guy in the video "How to Trigger A Segue In xCode 8 (Swift 3.0)" - URL: https://www.youtube.com/watch?v=WfT-hJXuiys
                    //direct user to next screen based on account type
                    if accountTypeNumber == 0 { //go to Mentor Home screen
                        performSegue(withIdentifier: "sendToMentorHome", sender: self)
                        
                    } else { //go to Mentee Home screen
                        performSegue(withIdentifier: "sendToMenteeHome", sender: self)
                    }
                    
                    //update foundUser variable
                    //foundUser = true
                    foundUserCount += 1
                    print(foundUserCount)
                    
                } else {
                    ////implement alert to notify user of login error - still debugging
                    //self.alertController = UIAlertController(title: "Login Error", message: "Invalid login. Please try again.", preferredStyle: UIAlertControllerStyle.alert)
                    //
                    //let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action:UIAlertAction) in print("OK Button Pressed")
                    //}
                    //
                    //self.alertController!.addAction(OKAction)
                    //
                    //present(self.alertController!, animated: true, completion: nil)
                    
                    print("Incorrect username or password")
                } */
           // }
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let desVC = segue.destination as? MatchResultsTableViewController {
            desVC.mentorArray = array
        }
    }
    


    @IBAction func english_clicked(_ sender: Any) {
       english_button_outlet.backgroundColor = UIColor.darkGray
        for i in 0..<array.count {
         if array[i].major == "english"
         { final_mentors.append(array[i])
            }
        }
    }

    @IBAction func math_clicked(_ sender: Any) {
        
         math_button_outlet.backgroundColor = UIColor.darkGray
     //   print (array.count)
        for i in 0..<array.count {
            if array[i].major == "math"
            { final_mentors.append(array[i])
            }
        }
    }

    @IBAction func finance_clicked(_ sender: Any) {
        finance_button_outlet.backgroundColor = UIColor.darkGray
        for i in 0..<array.count {
            if array[i].major == "finance"
            { final_mentors.append(array[i])
            }
        }
    }

    @IBAction func biology_clicked(_ sender: Any) {
        
        biology_button_outlet.backgroundColor = UIColor.darkGray
        for i in 0..<array.count {
            if array[i].major == "biology"
            { final_mentors.append(array[i])
            }
        }
    }

}
