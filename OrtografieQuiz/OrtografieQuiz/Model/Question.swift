//
//  Question.swift
//  OrtografieQuiz
//
//  Created by user169471 on 5/9/20.
//  Copyright © 2020 dcg-351. All rights reserved.
//

import Foundation


class Question {
    let questionTitle: String
    let firstAnswer: String
    let secondAnswer: String
    let correctAnswer: Int
    
    init(questionTitle: String, firstAnswer: String, secondAnswer: String, correctAnswer: Int) {
        self.questionTitle = questionTitle
        self.firstAnswer = firstAnswer
        self.secondAnswer = secondAnswer
        self.correctAnswer = correctAnswer
    }
}
