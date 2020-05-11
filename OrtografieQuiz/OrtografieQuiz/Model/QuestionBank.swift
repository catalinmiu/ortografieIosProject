//
//  QuestionBank.swift
//  OrtografieQuiz
//
//  Created by user169471 on 5/9/20.
//  Copyright © 2020 dcg-351. All rights reserved.
//

import Foundation
import FirebaseDatabase

class QuestionBank {
    var list = [Question]()
    
    //var ref: DatabaseReference?
    //var ref = Database.database().reference()
    
    init() {
        /*ref.child("Questions").set
            .queryOrdered(byChild: "id").queryEqual(toValue: 2).observeSingleEvent(of: .value) { (snapshot) in
            print(snapshot)
        }
        ref.child("Questions").queryOrdered(byChild: "id").queryEqual(toValue: 3).observeSingleEvent(of: .value) { (snapshot) in
            print(snapshot)
        }*/
        list.append(Question(questionTitle: "ce va ___?", firstAnswer: "vi", secondAnswer: "fi", correctAnswer: 1))
        list.append(Question(questionTitle: "_____ nu o sa fie la fel de frumos?", firstAnswer: "niciodata", secondAnswer: "nici o data", correctAnswer: 0))
        list.append(Question(questionTitle: "Ma duc pana acasa sa imi ___ ceva de mancare?", firstAnswer: "niciodata", secondAnswer: "nici o data", correctAnswer: 0))
        list.append(Question(questionTitle: "_____ nu o sa fie la fel de frumos?", firstAnswer: "niciodata", secondAnswer: "nici o data", correctAnswer: 1))
    }
}
