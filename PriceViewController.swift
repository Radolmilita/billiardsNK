//
//  PriceViewController.swift
//  nk
//
//  Created by Валерий on 15.03.2021.
//

import UIKit

class PriceViewController: UIViewController{

    @IBOutlet var tableView: UITableView!
    let days = [
    "Понедельник    72 грн/час",
    "Вторник        72 грн/час",
    "Среда          72 грн/час",
    "Четверг        78 грн/час",
    "Пятница        78 грн/час",
    "Суббота        78 грн/час",
    "Воскресенье    78 грн/час"]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView?.delegate = self
        tableView?.dataSource = self
        view.backgroundColor = .systemGray

    }
    

  
}
extension PriceViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print ("Такие у нас приятные цены")
    }
}
extension PriceViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return days.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let priceCell = tableView.dequeueReusableCell(withIdentifier: "priceCell", for: indexPath)
        priceCell.textLabel?.text = days [indexPath.row]
        return priceCell
    }
}
