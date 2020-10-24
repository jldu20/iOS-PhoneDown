//
//  AchieveController.swift
//  ShrewHack
//
//  Created by Asher Dale on 4/8/17.
//  Copyright © 2017 Asher Dale. All rights reserved.
//

import UIKit

class AchieveController: UIViewController, UIScrollViewDelegate {
    
    let width = Int(UIScreen.main.bounds.width)
    let height = Int(UIScreen.main.bounds.height)
    var scrollView: UIScrollView!
    var containerView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()

        makeLabel(label: UILabel(), text: "Achievements", rect: CGRect(x: width/2-150, y: 50, width: 300, height: 50), font: UIFont(name: "HelveticaNeue-Thin", size: 35)!)
        
        makeButton(fileName: "Back.png", frame: CGRect(x: 13, y: 50, width: 50, height: 50), selector: #selector(self.backPressed))
        
        scrollView = UIScrollView()
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: self.width, height: 26*140)
        containerView = UIView()
        self.view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        
        let achievements = ["Reached level 2",
                            "Reached level 5",
                            "Reached level 10",
                            "Reached level 15",
                            "Reached level 20",
                            "Reached level 25",
                            "Reached level 30",
                            "Reached level 35",
                            "Reached level 40",
                            "Reached level 45",
                            "Reached level 50",
                            "PhoneDown for 1 hours at once",
                            "PhoneDown for 3 hours at once",
                            "PhoneDown for 6 hours at once",
                            "PhoneDown for 12 hours at once",
                            "PhoneDown for 24 hours at once",
                            "PhoneDown for 50 hours in total",
                            "PhoneDown for 100 hours in total",
                            "PhoneDown for 150 hours in total",
                            "PhoneDown for 200 hours in total",
                            "PhoneDown for 250 hours in total",
                            "PhoneDown for 300 hours in total",
                            "PhoneDown for 350 hours in total",
                            "PhoneDown for 400 hours in total",
                            "PhoneDown for 450 hours in total",
                            "PhoneDown for 500 hours in total",
                            ]
        
        updateAchievements()
        for i in 0..<achievements.count {
            var completed = false
            if User.sharedUser.completedAchievements.contains(i) {
                completed = true
            }
            containerView.addSubview(Achievement(frame: CGRect(x: 15, y: i*140, width: width-30, height: 130), text: achievements[i], full: completed))
        }
        
        makeLabel(label: UILabel(), text: "\(User.sharedUser.completedAchievements.count) / 26", rect: CGRect(x: width/2-50, y: 100, width: 100, height: 40), font: UIFont(name:"HelveticaNeue-Thin", size: 25)!)
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
    
    // Loads and places a button icon on a specified part of the header
    func makeButton(fileName: String, frame: CGRect, selector: Selector) {
        let image = UIImage(named: fileName)?.withRenderingMode(.alwaysTemplate)
        let button = UIButton(type: UIButtonType.custom)
        button.frame = frame
        button.setImage(image, for: .normal)
        button.tintColor = ViewController.appColor
        button.addTarget(self, action: selector, for: .touchUpInside)
        self.view.addSubview(button)
    }
    
    func backPressed() {
        self.performSegue(withIdentifier: "achieveToMain", sender: self)
    }
    
    // Readjusts the UIScrollView
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = CGRect(x: 0, y: 150, width: self.width, height: self.height-150)
        containerView.frame = CGRect(x: 0, y: 0, width: scrollView.contentSize.width, height: scrollView.contentSize.height)
    }
    
    func updateAchievements() {
        if User.sharedUser.level >= 2 && !User.sharedUser.completedAchievements.contains(0) {
            User.sharedUser.completedAchievements.append(0)
        }
        if User.sharedUser.level >= 5 && !User.sharedUser.completedAchievements.contains(1) {
            User.sharedUser.completedAchievements.append(1)
        }
        if User.sharedUser.level >= 10 && !User.sharedUser.completedAchievements.contains(2) {
            User.sharedUser.completedAchievements.append(2)
        }
        if User.sharedUser.level >= 15 && !User.sharedUser.completedAchievements.contains(3) {
            User.sharedUser.completedAchievements.append(3)
        }
        if User.sharedUser.level >= 20 && !User.sharedUser.completedAchievements.contains(4) {
            User.sharedUser.completedAchievements.append(4)
        }
        if User.sharedUser.level >= 25 && !User.sharedUser.completedAchievements.contains(5) {
            User.sharedUser.completedAchievements.append(5)
        }
        if User.sharedUser.level >= 30 && !User.sharedUser.completedAchievements.contains(6) {
            User.sharedUser.completedAchievements.append(6)
        }
        if User.sharedUser.level >= 35 && !User.sharedUser.completedAchievements.contains(7) {
            User.sharedUser.completedAchievements.append(7)
        }
        if User.sharedUser.level >= 40 && !User.sharedUser.completedAchievements.contains(8) {
            User.sharedUser.completedAchievements.append(8)
        }
        if User.sharedUser.level >= 45 && !User.sharedUser.completedAchievements.contains(9) {
            User.sharedUser.completedAchievements.append(9)
        }
        if User.sharedUser.level >= 50 && !User.sharedUser.completedAchievements.contains(10) {
            User.sharedUser.completedAchievements.append(10)
        }
        if User.sharedUser.totalTime/3600 >= 500 && !User.sharedUser.completedAchievements.contains(25) {
            User.sharedUser.completedAchievements.append(25)
        }
        if User.sharedUser.totalTime/3600 >= 450 && !User.sharedUser.completedAchievements.contains(24) {
            User.sharedUser.completedAchievements.append(24)
        }
        if User.sharedUser.totalTime/3600 >= 400 && !User.sharedUser.completedAchievements.contains(23) {
            User.sharedUser.completedAchievements.append(23)
        }
        if User.sharedUser.totalTime/3600 >= 350 && !User.sharedUser.completedAchievements.contains(22) {
            User.sharedUser.completedAchievements.append(22)
        }
        if User.sharedUser.totalTime/3600 >= 300 && !User.sharedUser.completedAchievements.contains(21) {
            User.sharedUser.completedAchievements.append(21)
        }
        if User.sharedUser.totalTime/3600 >= 250 && !User.sharedUser.completedAchievements.contains(20) {
            User.sharedUser.completedAchievements.append(20)
        }
        if User.sharedUser.totalTime/3600 >= 200 && !User.sharedUser.completedAchievements.contains(19) {
            User.sharedUser.completedAchievements.append(19)
        }
        if User.sharedUser.totalTime/3600 >= 150 && !User.sharedUser.completedAchievements.contains(18) {
            User.sharedUser.completedAchievements.append(18)
        }
        if User.sharedUser.totalTime/3600 >= 100 && !User.sharedUser.completedAchievements.contains(17) {
            User.sharedUser.completedAchievements.append(17)
        }
        if User.sharedUser.totalTime/3600 >= 50 && !User.sharedUser.completedAchievements.contains(16) {
            User.sharedUser.completedAchievements.append(16)
        }
    }
}
