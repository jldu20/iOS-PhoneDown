//
//  Achievement.swift
//  ShrewHack
//
//  Created by Asher Dale on 4/8/17.
//  Copyright © 2017 Asher Dale. All rights reserved.
//

import UIKit

class Achievement: UIView {
    
    var descrip: String!
    var isComplete = false
    var imageView = UIImageView()
    
    init(frame: CGRect, text: String, full: Bool) {
        descrip = text
        super.init(frame: frame)
        layer.borderWidth = 1
        layer.borderColor = ViewController.appColor.cgColor
        layer.cornerRadius = 5
        
        if full {
            imageView = UIImageView(image: UIImage(named: "Trophy-Full.png")?.withRenderingMode(.alwaysTemplate))
        } else {
            imageView = UIImageView(image: UIImage(named: "Trophy.png")?.withRenderingMode(.alwaysTemplate))
        }
        
        imageView.frame = CGRect(x: 15, y: frame.height/2-25, width: 50, height: 50)
        imageView.tintColor = ViewController.appColor
        self.addSubview(imageView)
        
        makeLabel(label: UILabel(), text: descrip, rect: CGRect(x: 70, y: frame.height/2-50, width: frame.width-75, height: 100), font: UIFont(name: "HelveticaNeue-Thin", size: 19)!)
    }
    
    // Displays the title text of the tab in the center of the header
    func makeLabel(label: UILabel, text: String, rect: CGRect, font: UIFont) {
        label.frame = rect
        label.text = text
        label.font = font
        label.textColor = ViewController.appColor
        self.addSubview(label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
