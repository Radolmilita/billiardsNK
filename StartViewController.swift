//
//  StartViewController.swift
//  nk
//
//  Created by Валерий on 01.05.2021.
//

import UIKit
import FirebaseAuth
class StartViewController: UIViewController {
    // MARK: - Defining buttons action
    @IBAction func signInDidPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "LogInSeuge", sender: self)
    }
    
    @IBAction func SignUpDidPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "SignUpSeuge", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - already loggedIn
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if Auth.auth().currentUser != nil{
            self.performSegue(withIdentifier: "alreadyLoggedIn", sender: nil)
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
