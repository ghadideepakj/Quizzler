//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
//
//    let quiz = [
//        Questions(q: "A slug's blood is green.", a: "True"),
//        Questions(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
//        Questions(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
//        Questions(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True"),
//        Questions(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
//        Questions(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
//        Questions(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
//        Questions(q: "Google was originally called 'Backrub'.", a: "True"),
//        Questions(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
//        Questions(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
//        Questions(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
//        Questions(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")
//    ]
    
    @IBOutlet weak var questionLable: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
//    var questionNumber = 0
    var timer = Timer()
    var quizBrain = QuizBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton)
    {
        let userAnswer = sender.currentTitle!
//        let actualAnswer = quiz[questionNumber].answer
        
        let userGotItRight = quizBrain.checkAnswer(userAnswer)

        if userGotItRight{
            
            sender.backgroundColor = UIColor.green

        }
        else
        {
            sender.backgroundColor = UIColor.red
            
        }
        quizBrain.nextQuestion()
        
        
        Timer.scheduledTimer(timeInterval: 0.2, target:self, selector: #selector(updateUI), userInfo:nil, repeats: true)

        
        
    }
    
    
    @objc func updateUI()
    {
        questionLable.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        
        
    }
    
}

