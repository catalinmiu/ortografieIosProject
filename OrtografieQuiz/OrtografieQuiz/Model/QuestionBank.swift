//
//  QuestionBank.swift
//  OrtografieQuiz
//
//  Created by user169471 on 5/9/20.
//  Copyright © 2020 dcg-351. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseDatabase

class QuestionBank {
    var allList = [Question]()
    var list = [Question]()
    
    
    init() {
        let db = Firestore.firestore()
        db.collection("allQuestions").addSnapshotListener {
            query, error in
        
            if query!.count>0 {
                
                for document in query!.documents {
                    let questionObject = document.data() as? [String: AnyObject]
                    let questionTitle = questionObject?["question"]
                    let possibileAnswer1 = questionObject?["possibileAnswer1"]
                    let possibileAnswer2 = questionObject?["possibileAnswer2"]
                    var correctAnswer = questionObject?["correct_answer"]
                    if correctAnswer == nil {
                        correctAnswer = 0 as AnyObject
                    }
                    if let corr = (correctAnswer as? NSString)?.doubleValue {
                        self.allList.append(Question(questionTitle: questionTitle as! String,
                        firstAnswer: possibileAnswer1 as! String,
                        secondAnswer: possibileAnswer2  as! String,
                        correctAnswer: Int(correctAnswer as! String)!))
                    } else {
                                            self.allList.append(Question(questionTitle: questionTitle as! String,
                        firstAnswer: possibileAnswer1 as! String,
                        secondAnswer: possibileAnswer2  as! String,
                        correctAnswer: correctAnswer as! Int))

                    }
                    
                    
                }
                for _ in 1...10 {
                    let index = Int(arc4random_uniform(UInt32(self.allList.count)))
                    self.list.append(self.allList[index])
                    self.allList.remove(at: index)
                }
                
            
            }
        }
        
        
        
    }
    
    
    
    
}
