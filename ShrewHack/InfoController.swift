//
//  InfoController.swift
//  App1
//
//  Created by Aalap Patel on 4/8/17.
//  Copyright © 2017 Aalap Patel. All rights reserved.
//

import UIKit

class InfoController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let label = UILabel(frame: CGRect(x: 90, y: 50, width: 200, height: 50))
        label.textAlignment = NSTextAlignment.center
        label.font = UIFont(name: "HelveticaNeue-Thin", size: 35)
        label.text = "Information"
        self.view.addSubview(label)

        let purpose = UITextView(frame: CGRect(x: 0 , y: 100, width: 375, height: 380))
        purpose.isUserInteractionEnabled = false
        purpose.text = "The purpose of this app is to help you stay off your phone. Phone usage is taking over our lives, so it is important to limit it. By using this app, hopefully you are able to live in the present and make your day more productive! \n\nTo use the app:\n 1. Press the start button \n 2. Lock your phone\n3. Stay focused\n You will accumulate experience points until you stop the timer. If you start the timer and exit the app, the timer will be reset."
        purpose.font = UIFont(name: "HelveticaNeue-Thin", size: 20)
        purpose.textAlignment = .center
        
        self.view.addSubview(purpose)
        
        let creators = UILabel(frame:CGRect(x:0, y: 490, width: 375, height: 50))
        creators.text = "Creators"
        creators.font = UIFont(name: "HelveticaNeue-Thin", size: 35)
        creators.textAlignment = .center
        self.view.addSubview(creators)
        
        let name1 = UILabel(frame: CGRect(x:0, y: 540, width: 375, height: 30))
        name1.text = "Aalap P"
        name1.font = UIFont(name: "HelveticaNeue-Thin", size: 20)
        name1.textAlignment = .center
        self.view.addSubview(name1)
        
        let name2 = UILabel(frame: CGRect(x:0, y: 570, width: 375, height: 30))
        name2.text = "Asher D"
        name2.font = UIFont(name: "HelveticaNeue-Thin", size: 20)
        name2.textAlignment = .center
        self.view.addSubview(name2)
        
        let name3 = UILabel(frame: CGRect(x:0, y: 600, width: 375, height: 30))
        name3.text = "Jerry D"
        name3.font = UIFont(name: "HelveticaNeue-Thin", size: 20)
        name3.textAlignment = .center
        self.view.addSubview(name3)
        
        makeButton(fileName: "Back.png", frame: CGRect(x: 13, y: 50, width: 50, height: 50), selector: #selector(self.backPressed))
    }
    
    func backPressed() {
        self.performSegue(withIdentifier: "infoToMain", sender: self)
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
}
