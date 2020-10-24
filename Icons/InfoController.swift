//
//  InfoController.swift
//  ShrewHack
//
//  Created by Asher Dale on 4/8/17.
//  Copyright © 2017 Asher Dale. All rights reserved.
//


import UIKit

class InfoViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let label = UILabel(frame: CGRect(x: 90, y: 50, width: 200, height: 50))
        label.textAlignment = NSTextAlignment.center
        label.font = UIFont(name: "HelveticaNeue-Thin", size: 35)
        label.text = "Information"
        self.view.addSubview(label)

        let purpose = UITextView(frame: CGRect(x: 0 , y: 100, width: 375, height: 380))
        purpose.isUserInteractionEnabled = false
        purpose.text = "The purpose of this app is to help you stay off your phone! Technology is taking over our lives and it is important to limit everything we do. By using this app, hopefully you are able to make your day more productive! \n\nTo use the app:\n 1. Press the start button \n 2. Lock your phone\n3. Stay focused\n The app will accumulate experience points until the done button is pressed. If you start the timer and exit the app, your timer will be reset for using your phone."
        purpose.font = UIFont(name: "HelveticaNeue-Thin", size: 20)
        purpose.textAlignment = .center
        
       self.view.addSubview(purpose)
        
        let creators = UILabel(frame:CGRect(x:0, y: 490, width: 375, height: 50))
        creators.text = "Creators"
        creators.font = UIFont(name: "HelveticaNeue-Thin", size: 30)
        creators.textAlignment = .center
        self.view.addSubview(creators)
        
        let name1 = UILabel(frame: CGRect(x:0, y: 540, width: 375, height: 30))
        name1.text = "Aalap P"
        name1.font = UIFont(name: "HelveticaNeue-Thin", size: 20)
        name1.textAlignment = .center
        self.view.addSubview(name1)
        
        let name2 = UILabel(frame: CGRect(x:0, y: 560, width: 375, height: 30))
        name2.text = "Asher D"
        name2.font = UIFont(name: "HelveticaNeue-Thin", size: 20)
        name2.textAlignment = .center
        self.view.addSubview(name2)
        
        let name3 = UILabel(frame: CGRect(x:0, y: 580, width: 375, height: 30))
        name3.text = "Jerry D"
        name3.font = UIFont(name: "HelveticaNeue-Thin", size: 20)
        name3.textAlignment = .center
        self.view.addSubview(name3)
    }
}

