//
//  QuizViewController.swift
//  Quiz v.2
//
//  Created by Denis Aganin on 24.02.15.
//  Copyright (c) 2015 Potato Inc. All rights reserved.
//


import UIKit

var points = 0 // Personal score counter

class QuizViewController: UIViewController, UITextFieldDelegate {
    
    // UI Outlets
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var livesLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerField: UITextField!
    @IBOutlet weak var buttonOutlet: UIButton!
    @IBOutlet weak var checkLabel: UILabel!
    // UI Outlets

    
    
    // Button pressed actions
    @IBAction func checkButton(sender: AnyObject) {
        
        let answer = answerField.text
        
        for y in 0...(quizBase.quizArray.count - 1) {
            if questionLabel.text == quizBase.quizArray[y] {
                
                if answer.caseInsensitiveCompare(quizBase.answerArray[y]) == NSComparisonResult.OrderedSame {
                    
                    checkLabel.text = "Correct!"
                    
                    // Adding points for correct answer
                    func pointsPlus() -> Int {
                        points = points + 10
                        return points
                    }
                    pointsPlus()
                    pointsLabel.text = String(points)
                    // Adding points for correct answer
                    
                    // Reseting timer
                    timerReset()
                    timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "result", userInfo: nil, repeats: true)
                    
                    questionLabel.text = quizBase.addOne()
                    
                    if quizBase.x == 1 {
                        
                        self.performSegueWithIdentifier("Congratulations", sender: nil)
                    }
                    
                    
                    break
                    
                } else {
                    
                    checkLabel.text = "False!"
                    
                    // Taking 1 life for a mistake
                    func livesDown () -> Int {
                        lives -= 1
                        return lives
                    }
                    livesDown()
                    livesLabel.text = String(lives)
                    // Taking 1 life for a mistake
                    
                    // Reseting timer
                    timerReset()
                    timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "result", userInfo: nil, repeats: true)
                    
                    questionLabel.text = quizBase.addOne()
                    
                    break
                }
            }
        }
        
        answerField.text = ""
        
        
    }
    // Button pressed actions
    
    
    
    // Variables and Constants, Timer function, Game Over
    var lives = 3
    let quizBase = QuizBase()
    var timer = NSTimer()
    var count = 30
    
    //Game Over
    func result() {
        timerLabel.text = String(count--)
        checkLabel.text = ""
        for y in -100...0 {
        if livesLabel.text! == "\(y)" {
            timerReset()
            self.performSegueWithIdentifier("gameOver", sender: nil)
            break
        }
        if timerLabel.text! == "\(y)" {
            timerReset()
            self.performSegueWithIdentifier("gameOver", sender: nil)
            break
            }
        }
    }
    // Variables and Constants, Timer function, Game Over
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.answerField.delegate = self
        pointsLabel.text = String(points)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // Countdown and first question on the start
    override func viewDidAppear(animated: Bool) {
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "result", userInfo: nil, repeats: true)
        questionLabel.text = quizBase.addOne()
        resetStats()
    }
    // Countdown and first question on the start
    
    
    // Reseting timer & Stats
    func timerReset() {
        timer.invalidate()
        count = 30
        timerLabel.text = String(count)
    }
    func resetStats() {
        lives = 3
        points = 0
        pointsLabel.text = String(points)
        livesLabel.text = String(lives)
    }
    // Reseting timer & Stats

    //Keyboard hide
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
        checkLabel.text = ""
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        checkLabel.text = ""
        return false
    }
    //Keyboard hide
    
    
    
}


