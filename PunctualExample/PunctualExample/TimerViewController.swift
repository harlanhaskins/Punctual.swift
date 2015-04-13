//
//  TimerViewController.swift
//  PunctualExample
//
//  Created by Harlan Haskins on 4/11/15.
//  Copyright (c) 2015 harlanhaskins. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {

    @IBOutlet weak var secondsTextField: UITextField!
    var timer: NSTimer?
    var endDate: NSDate? = nil
    
    @IBAction func didTapStart(sender: UIButton) {
        self.timer = NSTimer(timeInterval: 1.second.timeInterval!, target: self, selector: "updateCountdown", userInfo: nil, repeats: true)
        NSRunLoop.currentRunLoop().addTimer(self.timer!, forMode: NSDefaultRunLoopMode)
        if let seconds = self.secondsTextField.text.toInt() {
            self.endDate = seconds.seconds.fromNow
        }
        self.secondsTextField?.resignFirstResponder()
    }
    
    func updateCountdown() {
        if let end = self.endDate {
            if end.timeIntervalSinceNow <= 0 {
                self.showTimerAlert()
                self.endDate = nil
            }
            self.updateClock()
        }
    }
    
    func updateClock() {
        let seconds = Int(round(self.endDate?.timeIntervalSinceNow ?? 0))
        self.secondsTextField.text = "\(seconds)"
    }
    
    func showTimerAlert() {
        let alert = UIAlertController(title: "Timer Done", message: nil, preferredStyle: .Alert)
        let action = UIAlertAction(title: "Woo!", style: .Default) { _ in
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        alert.addAction(action)
        self.presentViewController(alert, animated: true, completion: nil)
    }

    @IBAction func didTapStop(sender: UIButton) {
        self.timer?.invalidate()
        self.timer = nil
    }
    
    @IBAction func didTapReset(sender: UIButton) {
        self.endDate = nil
        self.didTapStop(sender)
        self.secondsTextField.text = "0"
    }
}
