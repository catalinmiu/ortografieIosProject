//
//  Clasament.swift
//  OrtografieQuiz
//
//  Created by user169471 on 5/26/20.
//  Copyright © 2020 dcg-351. All rights reserved.
//

import Foundation


import Foundation
import FirebaseFirestore
import FirebaseDatabase

class Clasament {
    /*var list = [String]()
    
    //var ref: DatabaseReference?
    
    
    //var ref = Database.database().reference().child("Questions")
    
    init() {
        let db = Firestore.firestore()
        db.collection("users").order(by: "total_correct_answers", descending: true).limit(to:5).addSnapshotListener {
                   query, error in
                   guard let snapshot = query else {
                       print("error ..\(error!)")
                       return
                   }
                   if snapshot.count>0 {
                       //self.list.removeAll()
                       
                       for document in query!.documents {
                           let questionObject = document.data() as? [String: AnyObject]
                        let firstName:String = questionObject?["firstname"] as! String
                        let TCA:Int = questionObject?["total_correct_answers"] as! Int
                           
                           let text = firstName + " \(TCA)"
                           self.list.append(text)
                       }
                       
                       
                   }
               }
               
           }
    func populate() ->  [String] {
        var newList: [String] = []
        let db = Firestore.firestore()
        db.collection("users").order(by: "total_correct_answers", descending: true).limit(to:5).addSnapshotListener {
                   query, error in
                   guard let snapshot = query else {
                       print("error ..\(error!)")
                       return
                   }
                   if snapshot.count>0 {
                       //self.list.removeAll()
                       
                       for document in query!.documents {
                           let questionObject = document.data() as? [String: AnyObject]
                        let firstName:String = questionObject?["firstname"] as! String
                        let TCA:Int = questionObject?["total_correct_answers"] as! Int
                           
                           let text = firstName + " \(TCA)"
                           newList.append(text)
                       }
                       
                       /*
                       for questions in snapshot.documents as![QueryDocumentSnapshot] {
                          if questions.key != "total_number_of_questions" {
                               let questionObject = questions.value as? [String: AnyObject]
                               let questionTitle = questionObject?["question"]
                               let possibileAnswer1 = questionObject?["possibileAnswer1"]
                               let possibileAnswer2 = questionObject?["possibileAnswer2"]
                               let correctAnswer = questionObject?["correct_answer"]
                               //list.append(Question(questionTitle: "Ma duc pana acasa sa imi ___ ceva de mancare?", firstAnswer: "niciodata", secondAnswer: "nici o data", correctAnswer: 0))
                               self.list.append(Question(questionTitle: questionTitle as! String,
                                                         firstAnswer: possibileAnswer1 as! String,
                                                         secondAnswer: possibileAnswer2  as! String,
                                                         correctAnswer: correctAnswer as! Int))
                          }
                       }*/
                   }
               }
               /*ref.observe(DataEventType.value) { (snapshot) in
                        if snapshot.childrenCount>0 {
                            //self.list.removeAll()
                            for questions in snapshot.children.allObjects as![DataSnapshot] {
                               if questions.key != "total_number_of_questions" {
                                    let questionObject = questions.value as? [String: AnyObject]
                                    let questionTitle = questionObject?["question"]
                                    let possibileAnswer1 = questionObject?["possibileAnswer1"]
                                    let possibileAnswer2 = questionObject?["possibileAnswer2"]
                                    let correctAnswer = questionObject?["correct_answer"]
                                    //list.append(Question(questionTitle: "Ma duc pana acasa sa imi ___ ceva de mancare?", firstAnswer: "niciodata", secondAnswer: "nici o data", correctAnswer: 0))
                                    self.list.append(Question(questionTitle: questionTitle as! String,
                                                              firstAnswer: possibileAnswer1 as! String,
                                                              secondAnswer: possibileAnswer2  as! String,
                                                              correctAnswer: correctAnswer as! Int))
                               }
                            }
                        }
                    }*/
               
               /*ref.("Questions").s
                   .queryOrdered(byChild: "id").queryEqual(toValue: 2).observeSingleEvent(of: .value) { (snapshot) in
                   print(snapshot)
               }
               ref.child("Questions").queryOrdered(byChild: "id").queryEqual(toValue: 3).observeSingleEvent(of: .value) { (snapshot) in
                   print(snapshot)
               }
               list.append(Question(questionTitle: "ce va ___?", firstAnswer: "vi", secondAnswer: "fi", correctAnswer: 1))
               list.append(Question(questionTitle: "_____ nu o sa fie la fel de frumos?", firstAnswer: "niciodata", secondAnswer: "nici o data", correctAnswer: 0))
               list.append(Question(questionTitle: "Ma duc pana acasa sa imi ___ ceva de mancare?", firstAnswer: "niciodata", secondAnswer: "nici o data", correctAnswer: 0))
               list.append(Question(questionTitle: "_____ nu o sa fie la fel de frumos?", firstAnswer: "niciodata", secondAnswer: "nici o data", correctAnswer: 1))
        */
    return newList;
    }
    
    /*func getList() {
        return self.list;
    }*/
    */
}
