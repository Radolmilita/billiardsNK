//
//  SettingsViewController.swift
//  nk
//
//  Created by Валерий on 15.03.2021.
//

import UIKit
import FirebaseAuth
class SettingsViewController: UIViewController {
    @IBAction func logOutAction(_ sender: Any) {
        do {
                    try Auth.auth().signOut()
                }
             catch let signOutError as NSError {
                    print ("Error signing out: %@", signOutError)
                }
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let initial = storyboard.instantiateInitialViewController()
                UIApplication.shared.keyWindow?.rootViewController = initial
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray
    }

}
