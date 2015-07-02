//
//  DateCalculatorViewController.swift
//  PunctualExample
//
//  Created by Harlan Haskins on 4/11/15.
//  Copyright (c) 2015 harlanhaskins. All rights reserved.
//

import UIKit

class DateCalculatorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateDate()
    }
    
    func updateDate() {
        if let
            hours = self.hours,
            days = self.days,
            months = self.months,
            years = self.years,
            newDate = (hours + days + months + years).ago {
            self.dateLabel.text = newDate.longString
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
        if let text = self.hoursTextField.text {
            return Int(text)?.hours
        }
        return nil
    }
    @IBOutlet weak var daysTextField: UITextField!
    var days: NSDateComponents? {
        if let text = self.daysTextField.text {
            return Int(text)?.days
        }
        return nil
    }
    @IBOutlet weak var monthsTextField: UITextField!
    var months: NSDateComponents? {
        if let text = self.monthsTextField.text {
            return Int(text)?.months
        }
        return nil
    }
    @IBOutlet weak var yearsTextField: UITextField!
    var years: NSDateComponents? {
        if let text = self.yearsTextField.text {
            return Int(text)?.years
        }
        return nil
    }
}
