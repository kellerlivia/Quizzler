//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var alternativeA: UIButton!
    @IBOutlet weak var alternativeB: UIButton!
    @IBOutlet weak var alternativeC: UIButton!
    
    //instantiation
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    //button (alternativeA, alternativeB, alternativeC)
    @IBAction func answerButttonPressed(_ sender: UIButton) {
        
        //constant that takes the title of the button
        let userAnswer = sender.currentTitle!
        
        //constant that calls the function checks if the answer is right
        let userGoItRight = quizBrain.checkAnswer(userAnswer)
        
        //reset the progress bar
        progressBar.progress = 0.0
        
        //change the button color according to the answer
        if userGoItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        //calling the function that calls the next question
        quizBrain.nextQuestion()
        
        //timer to count how long the color appears in the answer
        Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
    @objc func updateUI() {
        //calling the function that changes the quesion
        questionLabel.text = quizBrain.getQuestionText()
        
        //each button get an alternative through array index
        let answerAlternative = quizBrain.getAnswers()
        alternativeA.setTitle(answerAlternative[0], for: .normal)
        alternativeB.setTitle(answerAlternative[1], for: .normal)
        alternativeC.setTitle(answerAlternative[2], for: .normal)
        
        //updatint the progress bar and printing the score
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        //clean the color
        alternativeA.backgroundColor = UIColor.clear
        alternativeB.backgroundColor = UIColor.clear
        alternativeC.backgroundColor = UIColor.clear
    }
}

