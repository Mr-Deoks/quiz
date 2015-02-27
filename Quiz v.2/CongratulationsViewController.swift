//
//  CongratulationsViewController.swift
//  Quiz v.2
//
//  Created by Denis Aganin on 24.02.15.
//  Copyright (c) 2015 Potato Inc. All rights reserved.
//

import UIKit

class CongratulationsViewController: UIViewController, UITextFieldDelegate  {
    
    @IBOutlet weak var personalScore: UILabel!
    @IBOutlet weak var nameField: UITextField!
    
    @IBAction func submitButton(sender: AnyObject) {
    
        if personalScore.text != nil {
            nameList.append("\(nameField.text) : \(personalScore.text!) points")
        } else {
            nameList.append("\(nameField.text) : 0 points")
        }
        NSUserDefaults.standardUserDefaults().setObject(nameList, forKey: "nameList")
        
        nameField.text = ""
        
        self.performSegueWithIdentifier("Home2", sender: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        personalScore.text = String(points)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Keyboard hide
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
        
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    //Keyboard hide
}
