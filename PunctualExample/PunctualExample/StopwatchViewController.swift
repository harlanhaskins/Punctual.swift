//
//  StopwatchViewController.swift
//  PunctualExample
//
//  Created by Harlan Haskins on 4/11/15.
//  Copyright (c) 2015 harlanhaskins. All rights reserved.
//

import UIKit

class StopwatchViewController: UIViewController {

    var timer: NSTimer?
    var currentTime: NSTimeInterval = 0
    
    @IBOutlet weak var clockLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func updateClock() {
        self.currentTime += 1.millisecond.timeInterval!
        var elapsedTime = self.currentTime
        
        //calculate the minutes in elapsed time.
        let minutes = UInt8(elapsedTime / 60.0)
        elapsedTime -= (NSTimeInterval(minutes) * 60)
        
        //calculate the seconds in elapsed time.
        let seconds = UInt8(elapsedTime)
        elapsedTime -= NSTimeInterval(seconds)
        
        //find out the fraction of milliseconds to be displayed.
        let fraction = UInt8(elapsedTime * 100)
        
        //add the leading zero for minutes, seconds and millseconds and store them as string constants
        let strMinutes = minutes > 9 ? String(minutes):"0" + String(minutes)
        let strSeconds = seconds > 9 ? String(seconds):"0" + String(seconds)
        let strFraction = fraction > 9 ? String(fraction):"0" + String(fraction)
        
        //concatenate minutes, seconds and milliseconds as assign it to the UILabel
        self.clockLabel.text = "\(strMinutes):\(strSeconds):\(strFraction)"
    }
    
    deinit {
        self.timer?.invalidate()
    }

    @IBAction func didTapStart(sender: AnyObject) {
        self.timer = NSTimer(timeInterval: 1.millisecond.timeInterval!, target: self, selector: "updateClock", userInfo: nil, repeats: true)
        NSRunLoop.currentRunLoop().addTimer(self.timer!, forMode: NSDefaultRunLoopMode)
    }
    
    @IBAction func didTapStop(sender: AnyObject) {
        self.timer?.invalidate()
        self.timer = nil
    }
    
    @IBAction func didTapReset(sender: AnyObject) {
        self.currentTime = 0
        self.updateClock()
        self.didTapStop(sender)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
