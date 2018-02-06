//
//  ViewController.swift
//  QuickMaths
//
//  Created by Jacob Bullon on 1/31/18.
//  Copyright © 2018 Jacob Bullon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let question = ["Solve for x: 3x-18=22",
                    "Solve for x: 2x-2=14",
                    "Solve for x: 6x=18",
                    "Calculate the x-intercept of the line: y=6x-12",
                    "Calculate the slope of the line: 25x-18=22",
                    "Calculate the y-intercept of the line: 14x+15"]
    
    let answers = [["13.3","0.07","6","0.13","0.75","-13.3"],
                   ["8","0.07","13.3","4","-8","-13.3",],
                   ["3","-12","6","12","-6","-13.3",],
                   ["(2,0)","(0,2)","(2,3)","(18,0)","(0,18)","(6,0)"],
                   ["25","1.38","22","4","3","22",],
                   ["(0,15)","(15,0)","(-14,0)","(14,0)","(-0,15)","(-15,0)",]]
    
    var currentQuestion = 0
    var correctAnswerPlacement = 0
    var points = 0
    
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBAction func buttonSelect(_ sender: AnyObject) {
        if (sender.tag == Int(correctAnswerPlacement)) {
            print("correct")
            points += 1
        } else {
            print("wrong")
            // Send user back to beginning with a new random question
        }
        if (currentQuestion != question.count) {
            newQuestion()
        }
        else {
            performSegue(withIdentifier: "showScore", sender: self)
        }
    }
    
    override func viewDidAppear(_ animated : Bool) {
        newQuestion()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func newQuestion() {
        questionLabel.text = question[currentQuestion]
        correctAnswerPlacement = Int(arc4random_uniform(6)+1)
        
        var button:UIButton = UIButton()
        var x = 1
        
        for i in 1...6 {
            // Create a button
            button = view.viewWithTag(i) as! UIButton
            if (i == Int(correctAnswerPlacement)) {
                button.setTitle(answers[currentQuestion][0], for: .normal)
            } else {
                button.setTitle(answers[currentQuestion][x], for: .normal)
                x += 1
            }
        }
        currentQuestion += 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

