//
//  ViewController.swift
//  OrtografieQuiz
//
//  Created by user169471 on 5/1/20.
//  Copyright © 2020 dcg-351. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    @IBOutlet weak var questionTitle: UILabel!
//    var asdq: DatabaseReference
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        asdq = DatabaseReference..child("Questions")
    
        //ref.child("Questions").childByAutoId().setValue(["question": "_____ sunt cuminti", "possibileAnswer1": "Copii", "possibileAnswer2": "Copiii", "correct_answer": 1])
        //ref.child("Questions").childByAutoId().setValue(["question": "Sa incepi din noaptea aceea, ____ minte", "possibileAnswer1": "tii", "possibileAnswer2": "ti", "correct_answer": 1])
        //ref.child("Questions").childByAutoId().setValue(["question": "Cum de in cateva zile ____ schimbat astfel locurile", "possibileAnswer1": "s-au", "possibileAnswer2": "sau", "correct_answer": 1])
        //ref.childByAutoId().setValue(["name": "TOM", "age":14, "gender": "F"])
    }

    
}

