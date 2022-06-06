//
//  LoginViewController.swift
//  nk
//
//  Created by Валерий on 01.05.2021.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    // MARK: - Defining of Elements
    @IBOutlet weak var logInEmail: UITextField!
    
    @IBOutlet weak var logInPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    // MARK: - Logging in

    @IBAction func logInAction(_ sender: Any) {
        
        
        Auth.auth().signIn(withEmail: logInEmail.text!, password: logInPassword.text!) { (user, error) in
     if error == nil{
       self.performSegue(withIdentifier: "loginToHome", sender: self)
                    }
      else{
       let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
       let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                      
        alertController.addAction(defaultAction)
        self.present(alertController, animated: true, completion: nil)
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
