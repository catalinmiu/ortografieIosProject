//
//  HomeViewController.swift
//  OrtografieQuiz
//
//  Created by user169471 on 5/25/20.
//  Copyright © 2020 dcg-351. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var scoreText:String = ""
    
    //var dummyData = ["catalin - 10 score", "Halina - 5 puncte", "Ovidiu - 12 puncte"]
    
    var dummyData:[String] = []

    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var score: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        //var dummy
        let clasament = Clasament()
        dummyData = clasament.populate()
        tableView.dataSource = self
        tableView.delegate = self
        
        score?.text = scoreText
        // Do any additional setup after loading the view.
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
