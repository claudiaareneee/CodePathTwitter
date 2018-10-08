//
//  User.swift
//  twitter_alamofire_demo
//
//  Created by Claudia Nelson on 10/4/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit

class User{

    // MARK: Properties
    var name: String?
    var screenName: String?
    static var current: User?
    
    // MARK: dictionary initializer
    init(dictionary: [String: Any]) {
        name = dictionary["name"] as? String
        screenName = dictionary["screen_name"] as? String
    }
}
