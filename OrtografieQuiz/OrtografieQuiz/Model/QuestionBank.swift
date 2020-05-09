//
//  QuestionBank.swift
//  OrtografieQuiz
//
//  Created by user169471 on 5/9/20.
//  Copyright © 2020 dcg-351. All rights reserved.
//

import Foundation


class QuestionBank {
    var list = [Question]()
    
    init() {
        list.append(Question(questionTitle: "ce va ___?", firstAnswer: "vi", secondAnswer: "fi", correctAnswer: 1))
        list.append(Question(questionTitle: "_____ nu o sa fie la fel de frumos?", firstAnswer: "niciodata", secondAnswer: "nici o data", correctAnswer: 2))
        list.append(Question(questionTitle: "Ma duc pana acasa sa imi ___ ceva de mancare?", firstAnswer: "niciodata", secondAnswer: "nici o data", correctAnswer: 2))
        list.append(Question(questionTitle: "_____ nu o sa fie la fel de frumos?", firstAnswer: "niciodata", secondAnswer: "nici o data", correctAnswer: 2))


    }
}
