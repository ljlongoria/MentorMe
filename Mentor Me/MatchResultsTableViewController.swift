//
//  MatchResultsTableViewController.swift
//  Mentor Me
//
//  Created by Meghan Magee on 4/17/17.
//  Copyright © 2017 Prarthana Neotia. All rights reserved.
//

import UIKit
import CoreData

class MatchResultsTableViewController: UITableViewController {
    
    var mentorArray = [hold_mentor]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return mentorArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = mentorArray[indexPath.item].firstName!
        cell.detailTextLabel?.text = mentorArray[indexPath.item].lastName!
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let cell = sender as! UITableViewCell
        let indexpath = tableView.indexPath(for: cell)
        let mentor = mentorArray[(indexpath?.row)!]
        
        if segue.identifier == "segueId" {
            if let desVC = segue.destination as? MentorDetailsViewController {
                
                desVC.firstNameStr = mentor.firstName!
                desVC.lastNameStr = mentor.lastName!
                desVC.yearStr = mentor.year!
                desVC.adviceTypeStr = mentor.adviceType!
                desVC.emailStr = mentor.email!
                desVC.phoneStr = mentor.phone!
            }
        }
    }
    

}
