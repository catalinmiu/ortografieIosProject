//
//  ViewController.swift
//  OrtografieQuiz
//
//  Created by user169471 on 5/1/20.
//  Copyright © 2020 dcg-351. All rights reserved.
//

import UIKit
//import Firebase

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionCounter: UILabel!
    @IBOutlet weak var progressView: UIView!
    @IBOutlet weak var questionsLabel: UILabel!
    
    
    @IBOutlet weak var optionA: UIButton!
    @IBOutlet weak var optionB: UIButton!
    
    let allQuestions = QuestionBank()
    var questionNumber: Int = 0
    var score: Int = 0
    var selectedAnswer: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ProgressHUD.show("Please wait...", interaction: false)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
            self.updateQuestion()
            ProgressHUD.dismiss()
        }
        
}

    @IBAction func answerPressed(_ sender: UIButton) {
        if sender.tag == selectedAnswer {
            ProgressHUD.showSuccess("Correct", interaction: false)
            print("correct")
            score += 1
        } else {
            ProgressHUD.showError("Wrong", interaction: false)
            //ProgressHUD.showError("Wrong Answer")
            print("wrong")
        }
        questionNumber += 1
        updateQuestion()
        updateUI()
        
    }
    
    func updateQuestion() {
        
        if questionNumber<allQuestions.list.count {
            questionsLabel.text = allQuestions.list[questionNumber].questionTitle
            
            optionA.setTitle(allQuestions.list[questionNumber].firstAnswer, for: UIControl.State.normal)
            optionB.setTitle(allQuestions.list[questionNumber].secondAnswer, for: UIControl.State.normal)
            selectedAnswer = allQuestions.list[questionNumber].correctAnswer
        }
        else {
            questionNumber -= 1
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.9) {
                let alert = UIAlertController(title: "Awesome", message: "End of Quiz. Do you want to start over?", preferredStyle: .alert)
                let restartAction = UIAlertAction(title: "Restart", style: .default, handler: {
                    action in self.restartQuiz()
                })
                
                alert.addAction(restartAction)
                self.present(alert, animated: true, completion: nil)

            }
                        
        }
        updateUI()
        
    }
    
    func updateUI() {
        
        scoreLabel.text = "Score: \(score)"
        questionCounter.text = "\(questionNumber + 1)/\(allQuestions.list.count)"
        progressView.frame.size.width = (view.frame.size.width / CGFloat(allQuestions.list.count)) * CGFloat(questionNumber+1)
    }
    
    func restartQuiz() {
        score = 0
        questionNumber = 0
        updateQuestion()
    }
    
}
