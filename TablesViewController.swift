//
//  TablesViewController.swift
//  nk
//
//  Created by Валерий on 15.03.2021.
//

import UIKit

class TablesViewController: UIViewController {

    @IBAction func tableOneDidPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "calendarLink", sender: self)
    }
    @IBAction func tableTwoDidPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "calendarLink", sender: self)
    }
    @IBAction func tableThreeDidPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "calendarLink", sender: self)
    }
    @IBAction func tableFourDidPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "calendarLink", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemGray
    }
    


}
