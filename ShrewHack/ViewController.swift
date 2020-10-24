//
//  ViewController.swift
//  ShrewHack
//
//  Created by Asher Dale on 4/8/17.
//  Copyright © 2017 Asher Dale. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let width = Int(UIScreen.main.bounds.width)
    var avatarImageView = UIImageView(image: UIImage(named: "Avatar.png"))
    let levelLabel = UILabel()
    var xpBar = UIView()
    var xpProgress = UIView()
    let xpLabel = UILabel()
    static let appColor = UIColor(hexString: "#4F91FF")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Loads previous data from the device (if applicable)
        if User.sharedUser.firstOpen {
            //resetData()
            if let savedUser = UserDefaults.standard.object(forKey: "user") as? Data {
                User.sharedUser = NSKeyedUnarchiver.unarchiveObject(with: savedUser) as! User
                User.sharedUser.firstOpen = false
            }
        }
        
        avatarImageView.frame = CGRect(x: width/2-75, y: 100, width: 150, height: 150)
        self.view.addSubview(avatarImageView)
        
        makeLabel(label: levelLabel, text: "Level \(User.sharedUser.level)", rect: CGRect(x: width/2 - 100, y: 300, width: 200, height: 50), font: UIFont(name:"HelveticaNeue-Thin", size: 50)!)
        
        makeButton(fileName: "Trophy.png", frame: CGRect(x: 13, y: 27, width: 40, height: 40), selector: #selector(self.trophyPressed(_:)))
        makeButton(fileName: "Info.png", frame: CGRect(x: width-53, y: 27, width: 40, height: 40), selector: #selector(self.infoPressed(_:)))
        
        xpBar = UIView(frame: CGRect(x: width/2-150, y: 400, width: 300, height: 10))
        xpBar.backgroundColor = UIColor.white
        xpBar.layer.borderWidth = 1
        xpBar.layer.borderColor = ViewController.appColor.cgColor
        xpBar.layer.cornerRadius = xpBar.bounds.height/2
        self.view.addSubview(xpBar)
        
        xpProgress = UIView(frame: CGRect(x: width/2-150, y: 400, width: 3*User.sharedUser.xp/User.sharedUser.level, height: 10))
        xpProgress.backgroundColor = ViewController.appColor
        let maskPath = UIBezierPath(roundedRect: xpProgress.bounds, byRoundingCorners: [.bottomLeft, .topLeft], cornerRadii: CGSize(width: xpProgress.bounds.height/2, height: xpProgress.bounds.height/2))
        let shape = CAShapeLayer()
        shape.path = maskPath.cgPath
        xpProgress.layer.mask = shape
        self.view.addSubview(xpProgress)
        
        makeLabel(label: xpLabel, text: "\(User.sharedUser.xp) / \(User.sharedUser.level*100)", rect: CGRect(x: width/2-50, y: 430, width: 100, height: 40), font: UIFont(name:"HelveticaNeue-Thin", size: 17)!)
        xpLabel.textColor = ViewController.appColor
        
        let startButton = UIButton()
        startButton.frame = CGRect(x: width/2-75, y: 530, width: 150, height: 40)
        startButton.setTitle("Start", for: .normal)
        startButton.setTitleColor(ViewController.appColor, for: .normal)
        startButton.addTarget(self, action: #selector(self.startPressed(_:)), for:.touchUpInside)
        startButton.layer.borderWidth = 1
        startButton.layer.borderColor = ViewController.appColor.cgColor
        startButton.layer.cornerRadius = 5
        startButton.titleLabel?.font = UIFont(name:"HelveticaNeue-Thin", size: 17)
        self.view.addSubview(startButton)
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
    
    func startPressed(_ sender: UIButton!) {
        self.performSegue(withIdentifier: "toTimer", sender: self)
    }
    
    func trophyPressed(_ sender: UIButton!) {
        self.performSegue(withIdentifier: "toAchieve", sender: self)
    }
    
    func infoPressed(_ sender: UIButton!) {
        self.performSegue(withIdentifier: "toInfo", sender: self)
    }
    
    // Saves the User singleton object onto the device
    static func saveData() {
        let savedData = NSKeyedArchiver.archivedData(withRootObject: User.sharedUser)
        UserDefaults.standard.set(savedData, forKey: "user")
    }
    
    // Erases all data from this app on the device
    func resetData() {
        for key in UserDefaults.standard.dictionaryRepresentation().keys {
            UserDefaults.standard.removeObject(forKey: key.description)
        }
    }
}

// Extension of UIColor to allow for hex color values
extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch hex.characters.count {
        case 3: (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default: (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}
