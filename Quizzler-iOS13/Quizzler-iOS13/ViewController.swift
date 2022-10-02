//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timerBar: UIProgressView!
    
    var quizBrain = QuizBrain()
    var timer = Timer()
    var secondsRemaining = 10
    
    func scoreResetAnimation(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2 ) {
            UIView.animate(withDuration: 0.2) { [self] in
            scoreLabel.alpha = 1.0
            scoreLabel.backgroundColor = UIColor.clear
    }
        }
    }
    func scoreLossAnimation() {
        UIView.animate(withDuration: 0.2) { [self] in
            scoreLabel.alpha = 0.5
            scoreLabel.backgroundColor = UIColor.red
        }
        self.scoreResetAnimation()
            }
        
    func scoreWinAnimation() {
        UIView.animate(withDuration: 0.2) { [self] in
            scoreLabel.alpha = 0.5
            scoreLabel.backgroundColor = UIColor.green
        }
        self.scoreResetAnimation()
    }
    
    func updateUI() {
        
        quizBrain.nextQuestion()
        questionLabel.text = quizBrain.getQuestionText()
        button1.setTitle(quizBrain.getAnswer()[0], for: .normal)
        button2.setTitle(quizBrain.getAnswer()[1], for: .normal)
        button3.setTitle(quizBrain.getAnswer()[2], for: .normal)
        progressBar.progress = quizBrain.barProgression()
        scoreLabel.text = "Puntos: \(quizBrain.getScore())"
        timer.invalidate()
        timerBar.progress = 0
        secondsRemaining = 4
        
        var secondsUsed = 0
        
        self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] (Timer) in
        if self.secondsRemaining > 0 {
                self.secondsRemaining -= 1
                secondsUsed += 1
                timerBar.progress = Float(secondsUsed) / Float(4)
            } else {
                Timer.invalidate()
                quizBrain.scoreNumber -= 50
                scoreLossAnimation()
                updateUI()
            }
        }
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        quizBrain.questionNumber -= 1
        updateUI()
    }
    
    @IBAction func actionButtonPressed(_ sender: UIButton) {
        
        if quizBrain.checkAnswer(sender.currentTitle!){
            UIView.animate(withDuration: 0.2) {
                sender.alpha = 0.5
                sender.backgroundColor = UIColor.green
            }
         scoreWinAnimation()
        } else {
            UIView.animate(withDuration: 0.2) {
                sender.alpha = 0.5
                sender.backgroundColor = UIColor.red
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2 ) {
            UIView.animate(withDuration: 0.2) {
                sender.alpha = 1.0
                sender.backgroundColor = UIColor.clear
            }
        }
        updateUI()
    }
}

