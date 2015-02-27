//
//  HighscoreViewController.swift
//  Quiz v.2
//
//  Created by Denis Aganin on 24.02.15.
//  Copyright (c) 2015 Potato Inc. All rights reserved.
//

import UIKit

var nameList = [String]()

class HighscoreViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var highscoreTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if NSUserDefaults.standardUserDefaults().objectForKey("nameList") != nil {
            nameList = NSUserDefaults.standardUserDefaults().objectForKey("nameList") as! [String]
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return nameList.count
    }
    
    //Adding data to the cells
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = "\(nameList[indexPath.row])"
        
        return cell

    }
    
    
    //Deleting data
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            
            nameList.removeAtIndex(indexPath.row)
            NSUserDefaults.standardUserDefaults().setObject(nameList, forKey: "nameList")
            highscoreTable.reloadData()
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        
        highscoreTable.reloadData()
    }
}
