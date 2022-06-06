//
//  ViewController.swift
//  nk
//
//  Created by Валерий on 11.03.2021.
//
import SideMenu
import UIKit
import FirebaseAuth

public var sideMenu: SideMenuNavigationController?
class ViewController: UIViewController, MenuControllerDelegate{
    // MARK: - Side Menu Initialization
    
    public let profileController = ProfileViewController()
    public let statisticController = StatisticViewController()
    public let tablesController = TablesViewController()
    public let timerController = TimerViewController()
    public let priceController = PriceViewController()
    public let gameController = GameViewController()
    public let settingsController = SettingsViewController()
    public let aboutUsController = AboutUsViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let menu = MenuController(with: SideMenuItem.allCases)
        menu.delegate = self
        sideMenu = SideMenuNavigationController(rootViewController: menu)

        sideMenu?.leftSide = true
        SideMenuManager.default.leftMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: view)
        addChildController()
    }
    // MARK: - Navigation Side Menu
    private func addChildController(){
        addChild(profileController)
        addChild(statisticController)
        addChild(tablesController)
        addChild(timerController)
        addChild(priceController)
        addChild(gameController)
        addChild(settingsController)
        addChild(aboutUsController)
        
        view.addSubview(profileController.view)
        view.addSubview(statisticController.view)
        view.addSubview(tablesController.view)
        view.addSubview(timerController.view)
        view.addSubview(priceController.view)
        view.addSubview(gameController.view)
        view.addSubview(settingsController.view)
        view.addSubview(aboutUsController.view)
        
        
        profileController.view.frame = view.bounds
        statisticController.view.frame = view.bounds
        tablesController.view.frame = view.bounds
        timerController.view.frame = view.bounds
        priceController.view.frame = view.bounds
        gameController.view.frame = view.bounds
        settingsController.view.frame = view.bounds
        aboutUsController.view.frame = view.bounds
        
        
        profileController.didMove(toParent: self)
        statisticController.didMove(toParent: self)
        tablesController.didMove(toParent: self)
        timerController.didMove(toParent: self)
        priceController.didMove(toParent: self)
        gameController.didMove(toParent: self)
        settingsController.didMove(toParent: self)
        aboutUsController.didMove(toParent: self)
        
        
        profileController.view.isHidden = true
        statisticController.view.isHidden = true
        tablesController.view.isHidden = true
        timerController.view.isHidden = true
        priceController.view.isHidden = true
        gameController.view.isHidden = true
        settingsController.view.isHidden = true
        aboutUsController.view.isHidden = true
    }
    @IBAction func didTapMenuButton(){
        present(sideMenu!,animated: true)
    }
    func didSelectMenuItem(named: SideMenuItem) {
        sideMenu?.dismiss(animated: true, completion: { [weak self] in
            self?.title = named.rawValue
            
            switch named {
            case .profile:
                self?.profileController.view.isHidden = false
                self?.statisticController.view.isHidden = true
                self?.tablesController.view.isHidden = true
                self?.timerController.view.isHidden = true
                self?.priceController.view.isHidden = true
                self?.gameController.view.isHidden = true
                self?.settingsController.view.isHidden = true
                self?.aboutUsController.view.isHidden = true
                self?.performSegue(withIdentifier: "ProfileLink", sender: self)
            case .statistic:
                self?.profileController.view.isHidden = true
                self?.statisticController.view.isHidden = false
                self?.tablesController.view.isHidden = true
                self?.timerController.view.isHidden = true
                self?.priceController.view.isHidden = true
                self?.gameController.view.isHidden = true
                self?.settingsController.view.isHidden = true
                self?.aboutUsController.view.isHidden = true
                self?.performSegue(withIdentifier: "StatisticLink", sender: self)
            case .tables:
                self?.profileController.view.isHidden = true
                self?.statisticController.view.isHidden = true
                self?.tablesController.view.isHidden = false
                self?.timerController.view.isHidden = true
                self?.priceController.view.isHidden = true
                self?.gameController.view.isHidden = true
                self?.settingsController.view.isHidden = true
                self?.aboutUsController.view.isHidden = true
                self?.performSegue(withIdentifier: "TablesLink", sender: self)
            case .timer:
                self?.profileController.view.isHidden = true
                self?.statisticController.view.isHidden = true
                self?.tablesController.view.isHidden = true
                self?.timerController.view.isHidden = false
                self?.priceController.view.isHidden = true
                self?.gameController.view.isHidden = true
                self?.settingsController.view.isHidden = true
                self?.aboutUsController.view.isHidden = true
                self?.performSegue(withIdentifier: "TimerLink", sender: self)
                
                
            case .price:
                self?.profileController.view.isHidden = true
                self?.statisticController.view.isHidden = true
                self?.tablesController.view.isHidden = true
                self?.timerController.view.isHidden = true
                self?.priceController.view.isHidden = false
                self?.gameController.view.isHidden = true
                self?.settingsController.view.isHidden = true
                self?.aboutUsController.view.isHidden = true
                self?.performSegue(withIdentifier: "PriceLink", sender: self)
            case .game:
                self?.profileController.view.isHidden = true
                self?.statisticController.view.isHidden = true
                self?.tablesController.view.isHidden = true
                self?.timerController.view.isHidden = true
                self?.priceController.view.isHidden = true
                self?.gameController.view.isHidden = false
                self?.settingsController.view.isHidden = true
                self?.aboutUsController.view.isHidden = true
                self?.performSegue(withIdentifier: "GameLink", sender: self)
            case .settings:
                self?.profileController.view.isHidden = true
                self?.statisticController.view.isHidden = true
                self?.tablesController.view.isHidden = true
                self?.timerController.view.isHidden = true
                self?.priceController.view.isHidden = true
                self?.gameController.view.isHidden = true
                self?.settingsController.view.isHidden = false
                self?.aboutUsController.view.isHidden = true
                self?.performSegue(withIdentifier: "SettingsLink", sender: self)
            case .aboutUs:
                self?.profileController.view.isHidden = true
                self?.statisticController.view.isHidden = true
                self?.tablesController.view.isHidden = true
                self?.timerController.view.isHidden = true
                self?.priceController.view.isHidden = true
                self?.gameController.view.isHidden = true
                self?.settingsController.view.isHidden = true
                self?.aboutUsController.view.isHidden = false
                self?.performSegue(withIdentifier: "AboutUsLink", sender: self)
            }
        })
    }
    

}
// MARK: - Menu Controller

protocol MenuControllerDelegate{
    func didSelectMenuItem(named: SideMenuItem)
}
enum SideMenuItem: String, CaseIterable{
    case profile = "Профиль"
    case statistic = "Статистика"
    case tables = "Столы"
    case timer = "Таймер"
    case price = "Цены"
    case game = "Игра"
    case settings = "Настройки"
    case aboutUs = "О нас"
}
class MenuController: UITableViewController{
    public var delegate:MenuControllerDelegate?
    public let menuItems:[SideMenuItem]
    public let color = UIColor(red: 33/255.0, green: 33/255.0, blue: 33/255.0, alpha: 1)
    init(with menuItems: [SideMenuItem]){
        self.menuItems = menuItems
        super.init(nibName: nil, bundle: nil)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = color
        view.backgroundColor = color
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = menuItems[indexPath.row].rawValue
        cell.textLabel?.textColor = .white
        cell.backgroundColor = color
        cell.contentView.backgroundColor = color
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedItem = menuItems[indexPath.row]
        delegate?.didSelectMenuItem(named: selectedItem)
    }
}
