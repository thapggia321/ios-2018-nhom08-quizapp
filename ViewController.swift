//
//  ViewController.swift
//  QuizApp
//
//  Created by Tuấn SPK on 3/30/18.
//  Copyright © 2018 Tuấn SPK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let questions = ["Thủ đô của Việt Nam?", "Thủ đô của Hoà Kỳ?", "Thủ đô của Nga?"]
    let anwsers = [["Hà Nội, Bangkok, Kuala Lumpur"], ["Washington, D.C., Buenos Aires, Ottawa"], ["Moskva, Seoul, Tashkent"]]
    
    // Label
    @IBOutlet weak var lblQuestion: UILabel!
    
    // Button
    @IBAction func btnAnwser(_ sender: AnyObject) {
        if (sender.tag == Int(rightAnwserPlacement)) {
            print("RIGHT!")
        }
        else {
            print("WRONG!!!!")
        }
        if (currentQuestion != questions.count) {
            newQuestion()
        }
    }
    
    // Variables
    var currentQuestion = 1
    var rightAnwserPlacement = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        newQuestion()
    }

    // Function that displays new question
    func newQuestion() {
        lblQuestion.text = questions[currentQuestion]
        
        rightAnwserPlacement = Int(arc4random_uniform(3) + 1)
        
        // Create a button
        var button : UIButton = UIButton()
        
        var x = 1
        
        for i in 1...3 {
            // Create a button
            button = view.viewWithTag(i) as! UIButton
            if (i == Int(rightAnwserPlacement)) {
                button.setTitle(anwsers[currentQuestion][0], for: .normal)
            }
            else {
                button.setTitle(anwsers[currentQuestion][x], for: .normal)
                
                x = 2
            }
        }
        currentQuestion += 1
    }
}

