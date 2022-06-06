//
//  CalendarViewController.swift
//  nk
//
//  Created by Валерий on 15.06.2021.
//

import UIKit
import FSCalendar

class CalendarViewController: UIViewController {
    
    @IBOutlet var calendar: FSCalendar!
    @IBOutlet var datePicker: UIDatePicker!
    
    private var selectedDate: Date?

    @IBAction func applyDateButtonTouchUpInside(_ sender: UIButton) {
        selectedDate = datePicker.date
        calendar.reloadData()
    }

}

extension CalendarViewController: FSCalendarDataSource {
    
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        guard let selectedDate = selectedDate else {
            return 0
        }
        
        let calendar = Calendar.autoupdatingCurrent
        let dateWithoutTime = calendar.date(bySettingHour: 0, minute: 0, second: 0, of: date)
        let selectedDateWithoutTime = calendar.date(bySettingHour: 0, minute: 0, second: 0, of: selectedDate)
        
        if dateWithoutTime == selectedDateWithoutTime {
            return 1
        }
        
        return 0
    }
    
}
