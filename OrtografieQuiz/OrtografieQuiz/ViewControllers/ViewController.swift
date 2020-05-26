//
//  ViewController.swift
//  OrtografieQuiz
//
//  Created by user169471 on 5/1/20.
//  Copyright © 2020 dcg-351. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

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
    
    //view will Appear || didAppear
    override func viewDidLoad() {
        super.viewDidLoad()
        ProgressHUD.show("Please wait...", interaction: false)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
            self.updateQuestion()
            ProgressHUD.dismiss()
        }
        
}
    
    /*override func viewDidAppear(_ animated: Bool) {
        //self.viewDidAppear(animated)
        self.updateQuestion()
        /*super.viewWillAppear(animated)()
        ProgressHUD.show("Please wait...", interaction: false)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
            self.updateQuestion()
            ProgressHUD.dismiss()
        }*/
    }*/

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
            let db = Firestore.firestore()
            let currentUid = Auth.auth().currentUser?.uid
            db.collection("users").whereField("uid", isEqualTo: currentUid).getDocuments { (query, err) in
                if err != nil {
                    
                }
                else if query!.documents.count != 1 {
                    
                }
                else {
                    let document = query!.documents.first
                    document?.reference.updateData(["total_correct_answers" : self.score])
                }
            }
            
            
            
            db.collection("quizHistory").addDocument(data: ["userId": currentUid, "acuratete": score]) {
                (error) in
                
                if error != nil {
                    //self.showError("User data couldn't ")
                }
            }
            //self.transitionToHome()
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
