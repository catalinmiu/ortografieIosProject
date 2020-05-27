//
//  HomeViewController.swift
//  OrtografieQuiz
//
//  Created by user169471 on 5/25/20.
//  Copyright © 2020 dcg-351. All rights reserved.
//

import UIKit
import FirebaseFirestore
import FBSDKShareKit
class HomeViewController: UIViewController, SharingDelegate {

    var scoreText:String = ""
    
    //var dummyData = ["catalin - 10 score", "Halina - 5 puncte", "Ovidiu - 12 puncte"]
    
    var dummyData:[String] = []

    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var score: UILabel!
    
    /*
    override func viewWillAppear(_ animated: Bool) {
        let db = Firestore.firestore()
        //sleep(23)
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
                           self.dummyData.append(text)
                       }
                       
                       
                   }
            self.tableView.reloadData()
               }
        
    }
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        let db = Firestore.firestore()
        //sleep(23)
        db.collection("users").order(by: "total_correct_answers", descending: true).limit(to:5).addSnapshotListener {
                   query, error in
                   guard let snapshot = query else {
                       print("error ..\(error!)")
                       return
                   }
                    self.dummyData = []
                   if snapshot.count>0 {
                       //self.list.removeAll()
                       
                       for document in query!.documents {
                           let questionObject = document.data() as? [String: AnyObject]
                        let firstName:String = questionObject?["firstname"] as! String
                        let TCA:Int = questionObject?["total_correct_answers"] as! Int
                           
                           let text = firstName + " \(TCA)"
                           self.dummyData.append(text)
                       }
                       
                       
                   }
            self.tableView.reloadData()
               }
        tableView.dataSource = self
        tableView.delegate = self
        
        //var dummy
        
        
        //let clasament = Clasament()
        //	dummyData = clasament.populate()
        
        
        score?.text = scoreText
        // Do any additional setup after loading the view.
        //shareTextOnFaceBook()
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            let alert = UIAlertController(title: "Awesome", message: "End of Quiz. Do you want to start over?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: {
                action in
                let homeViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.gameViewController) as? ViewController
                //homeViewController?.scoreText = "\(self.score)"
                self.view.window?.rootViewController = homeViewController
                
                self.view.window?.makeKeyAndVisible()
                //self.restartQuiz()
            })
            
            
            alert.addAction(restartAction)
            self.present(alert, animated: true, completion: nil)

        }
        
    }
    func shareTextOnFaceBook() {
        let shareContent = ShareLinkContent()
        shareContent.contentURL = URL.init(string: "https://developers.facebook.com")! //your link
        shareContent.quote = "Text to be shared"
        ShareDialog(fromViewController: self, content: shareContent, delegate: self).show()
    }

    func sharer(_ sharer: Sharing, didCompleteWithResults results: [String : Any]) {
        if sharer.shareContent.pageID != nil {
            print("Share: Success")
        }
    }
    func sharer(_ sharer: Sharing, didFailWithError error: Error) {
        print("Share: Fail")
    }
    func sharerDidCancel(_ sharer: Sharing) {
        print("Share: Cancel")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    
    
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        cell.textLabel!.text = dummyData[indexPath.row]
        return cell;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyData.count
    }
    /*func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
    }*/
}
