//
//  LogInViewController.swift
//  OrtografieQuiz
//
//  Created by user169471 on 5/25/20.
//  Copyright © 2020 dcg-351. All rights reserved.
//

import UIKit
import FirebaseAuth
class LogInViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var error: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpElements()
    }
    
    func setUpElements() {
        error.alpha = 0
        //Utilities.styleTextField(emailField)
        //Utilities.styleTextField(passwordField)
        Utilities.styleFilledButton(loginButton)
    }
    

    @IBAction func logginTapped(_ sender: Any) {
        
        let email = emailField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        Auth.auth().signIn(withEmail: email, password: password) {
            (result, err) in
            
            if err != nil {
                self.error.text = err!.localizedDescription
                self.error.alpha = 1
            }
            else {
                let homeViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.gameViewController) as? ViewController
                self.view.window?.rootViewController = homeViewController
                self.view.window?.makeKeyAndVisible()
            }
        }
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
