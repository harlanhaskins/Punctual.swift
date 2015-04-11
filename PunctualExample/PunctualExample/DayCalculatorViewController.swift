//
//  DayCalculatorViewController.swift
//  PunctualExample
//
//  Created by Harlan Haskins on 4/11/15.
//  Copyright (c) 2015 harlanhaskins. All rights reserved.
//

import UIKit

class DayCalculatorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateDate()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateDate() {
        if let
            hours = self.hours,
            days = self.days,
            months = self.months,
            years = self.years,
            newDate = (hours + days + months + years).ago {
            self.dateLabel.text = newDate.mediumString
        } else {
            self.dateLabel.text = "Invalid Date"
        }
    }
    
    @IBAction func fieldDidChange(sender: UITextField) {
        self.updateDate()
    }

    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var hoursTextField: UITextField!
    var hours: NSDateComponents? {
        return self.hoursTextField.text.toInt()?.hours
    }
    @IBOutlet weak var daysTextField: UITextField!
    var days: NSDateComponents? {
        return self.daysTextField.text.toInt()?.days
    }
    @IBOutlet weak var monthsTextField: UITextField!
    var months: NSDateComponents? {
        return self.monthsTextField.text.toInt()?.days
    }
    @IBOutlet weak var yearsTextField: UITextField!
    var years: NSDateComponents? {
        return self.yearsTextField.text.toInt()?.years
    }
}
