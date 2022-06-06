//
//  StatisticViewController.swift
//  nk
//
//  Created by Валерий on 15.03.2021.
//

import UIKit
import Charts

class StatisticViewController: UIViewController {
    @IBOutlet weak var pieChart: PieChartView?
    
    @IBOutlet weak var iosStepper: UIStepper?
    @IBOutlet weak var macStepper: UIStepper?
    
    var iosDataEntry = PieChartDataEntry(value: 0)
    var macDataEntry = PieChartDataEntry(value: 0)
    
    var numberOfDownloadsDataEntries = [PieChartDataEntry]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pieChart?.chartDescription.text = ""
        
        iosDataEntry.value = iosStepper?.value ?? 0
        iosDataEntry.label = "Выиграл"
        macDataEntry.value = macStepper?.value ?? 0

        macDataEntry.label = "Проиграл"
        
        numberOfDownloadsDataEntries = [iosDataEntry, macDataEntry]
        
        updateChartData()
        
    }
 
    @IBAction func changeiOS(_ sender: UIStepper) {
        iosDataEntry.value = sender.value
        updateChartData()
    }
    
    @IBAction func changeMac(_ sender: UIStepper) {
        macDataEntry.value = sender.value
        updateChartData()
    }
    
    
    func updateChartData() {
        
        let chartDataSet = PieChartDataSet(entries: numberOfDownloadsDataEntries, label: "")
        let chartData = PieChartData(dataSet: chartDataSet)
        
        let colors = [UIColor(named:"macColor"), UIColor(named:"iosColor")]
        chartDataSet.colors = colors as! [NSUIColor]
        
        pieChart?.data = chartData
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


