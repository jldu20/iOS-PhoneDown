//
//  TimerController.swift
//  ShrewHack
//
//  Created by Asher Dale on 4/8/17.
//  Copyright © 2017 Asher Dale. All rights reserved.
//

import UIKit

class TimerController: UIViewController {
    
    let width = Int(UIScreen.main.bounds.width)
    let timeLabel = UILabel()
    let startTime = Date()
    var seconds = 0
    var minutes = 0
    var hours = 0
    var timerString = ""
    var timer: Timer!
    let rewardLabel = UILabel()
    static var didExit = false
    static var screenOff = false
    let maxLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeLabel(label: timeLabel, text: "00:00:00", rect: CGRect(x: width/2 - 150, y: 200, width: 300, height: 80), font: UIFont(name:"HelveticaNeue-Thin", size: 75)!)
        makeLabel(label: rewardLabel, text: "You have gained 0 experience", rect: CGRect(x: width/2 - 185, y: 400, width: 370, height: 50), font: UIFont(name:"HelveticaNeue-Thin", size: 25)!)
        makeLabel(label: maxLabel, text: "You have reached the time limit", rect: CGRect(x: width/2 - 185, y: 300, width: 370, height: 50), font: UIFont(name:"HelveticaNeue-Thin", size: 25)!)
        maxLabel.textColor = UIColor.red
        maxLabel.isHidden = true
        
        let finishButton = UIButton()
        finishButton.frame = CGRect(x: width/2-75, y: 530, width: 150, height: 40)
        finishButton.setTitle("Done", for: .normal)
        finishButton.setTitleColor(ViewController.appColor, for: .normal)
        finishButton.addTarget(self, action: #selector(self.finishPressed(_:)), for:.touchUpInside)
        finishButton.layer.borderWidth = 1
        finishButton.layer.borderColor = ViewController.appColor.cgColor
        finishButton.layer.cornerRadius = 5
        self.view.addSubview(finishButton)
        
        TimerController.didExit = false
        TimerController.screenOff = false
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(TimerController.updateTimer), userInfo: nil, repeats: true)
        
        CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), Unmanaged.passUnretained(self).toOpaque(), displayStatusChangedCallback, "com.apple.springboard.lockcomplete" as CFString, nil, .deliverImmediately)
    }
    
    // Displays the title text of the tab in the center of the header
    func makeLabel(label: UILabel, text: String, rect: CGRect, font: UIFont) {
        label.frame = rect
        label.text = text
        label.font = font
        label.textColor = UIColor.black
        label.textAlignment = NSTextAlignment.center
        self.view.addSubview(label)
    }
    
    func finishPressed(_ sender: UIButton!) {
        if timeLabel.text != "00:00:00" {
            User.sharedUser.xp += -Int(startTime.timeIntervalSinceNow*1/18)
            User.sharedUser.totalTime += -Int(startTime.timeIntervalSinceNow)
            let hoursSinceStart = -Int(startTime.timeIntervalSinceNow)/3600
            print(hoursSinceStart)
            if hoursSinceStart >= 1 && !User.sharedUser.completedAchievements.contains(11) {
                User.sharedUser.completedAchievements.append(11)
            }
            if hoursSinceStart >= 3 && !User.sharedUser.completedAchievements.contains(12) {
                User.sharedUser.completedAchievements.append(12)
            }
            if hoursSinceStart >= 6 && !User.sharedUser.completedAchievements.contains(13) {
                User.sharedUser.completedAchievements.append(13)
            }
            if hoursSinceStart >= 12 && !User.sharedUser.completedAchievements.contains(14) {
                User.sharedUser.completedAchievements.append(14)
            }
            fixXP()
        }
        timer.invalidate()
        self.performSegue(withIdentifier: "toMain", sender: self)
    }
    
    func updateTimer() {
        if TimerController.didExit {
            usleep(1000000)
            if !TimerController.screenOff {
                resetPage()
                return
            }
        }
        var timeValue = -Int(startTime.timeIntervalSinceNow)
        timerString = ""
        hours = timeValue / 3600
        if hours > 23 {
            maxLabel.isHidden = false
            if !User.sharedUser.completedAchievements.contains(15) {
                User.sharedUser.completedAchievements.append(15)
            }
            timer.invalidate()
        }
        timeValue %= 3600
        minutes = timeValue / 60
        seconds =  timeValue % 60
        makeTimerString(num: hours)
        timerString += ":"
        makeTimerString(num: minutes)
        timerString += ":"
        makeTimerString(num: seconds)
        timeLabel.text = timerString
        rewardLabel.text = "You have gained \(-Int(startTime.timeIntervalSinceNow*1/18)) experience"
    }
    
    func makeTimerString(num: Int) {
        if num < 10 {
            timerString += "0"
        }
        timerString += "\(num)"
    }
    
    func fixXP() {
        if User.sharedUser.xp >= User.sharedUser.level*100 {
            User.sharedUser.xp -= User.sharedUser.level*100
            User.sharedUser.level += 1
            fixXP()
        }
    }
    
    func resetPage() {
        timer.invalidate()
        hours = 0
        minutes = 0
        seconds = 0
        timeLabel.text = "00:00:00"
        rewardLabel.text = "You have gained 0 experience"
        
        let alertController = UIAlertController(title: "You started to use your phone!", message: "Your time has been reset", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .default ) { action in print("canceled") }
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true) {}
    }
    
    private let displayStatusChangedCallback: CFNotificationCallback = { _, cfObserver, cfName, _, _ in
        guard let lockState = cfName?.rawValue as String? else {
            return
        }
        TimerController.screenOff = true
    }
}
