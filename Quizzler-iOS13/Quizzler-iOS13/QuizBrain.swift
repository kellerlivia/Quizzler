//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Livia Carvalho Keller on 23/08/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    let questions = [
        Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
        Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
        Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
        Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")

    ]
    
    var questionsNumber = 0
    var score = 0
    
    //check if the answer is correct and adds to the score
    mutating func checkAnswer (_ userAnswer: String) -> Bool {
        if userAnswer == questions[questionsNumber].rightAnswer {
            score += 1
            return true
        } else {
            return false
        }
    }
    
    //to return the score
    mutating func getScore() -> Int {
        return score
    }
    
    //get the wording of the question
    func getQuestionText() -> String {
        return questions[questionsNumber].text
    }
    
    //get an alternative through the index
    func getAnswers() -> [String] {
        return questions[questionsNumber].answers
    }
    
    //calcule the progress
    func getProgress() -> Float {
        let progress = Float(questionsNumber) / Float(questions.count)
        return progress
    }
    
    //next question and reset the score for the next round
    mutating func nextQuestion () {
        if questionsNumber + 1 < questions.count {
            questionsNumber += 1
        } else {
            questionsNumber = 0
            score = 0
        }
    }
}
