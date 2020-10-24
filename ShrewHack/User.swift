//
//  User.swift
//  ShrewHack
//
//  Created by Asher Dale on 4/8/17.
//  Copyright © 2017 Asher Dale. All rights reserved.
//

import UIKit

class User: NSObject, NSCoding {
    
    var level = 1
    var xp = 0
    var firstOpen = true
    var totalTime = 0
    static var sharedUser = User()
    var completedAchievements = [Int]()
    
    override init() {}
    
    // Creates a "User" object out of encoded data that was previously stored in the device
    required init(coder aDecoder: NSCoder) {
        level = aDecoder.decodeInteger(forKey: "level")
        xp = aDecoder.decodeInteger(forKey: "xp")
        totalTime = aDecoder.decodeInteger(forKey: "totalTime")
        completedAchievements = aDecoder.decodeObject(forKey: "completedAchievements") as! [Int]
        
    }
    
    // Encodes and saves a "User" object in the device
    func encode(with aCoder: NSCoder) {
        aCoder.encode(level, forKey: "level")
        aCoder.encode(xp, forKey: "xp")
        aCoder.encode(totalTime, forKey: "totalTime")
        aCoder.encode(completedAchievements, forKey: "completedAchievements")
    }
}
