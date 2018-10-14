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
    private static var _current: User?
    var profilePicString: String?
    var backgroundPicString: String?
    var followingCount: Int?
    var followersCount: Int?
    var tweetsCount: Int?
    
    // For user persistance
    var dictionary: [String: Any]?
    
    // MARK: dictionary initializer
    init(dictionary: [String: Any]) {
        self.dictionary = dictionary
        name = dictionary["name"] as? String
        screenName = dictionary["screen_name"] as? String
        profilePicString = dictionary["profile_image_url_https"] as? String
        backgroundPicString = dictionary["profile_banner_url"] as? String
        followingCount = dictionary["friends_count"] as? Int
        followersCount = dictionary["followers_count"] as? Int
        tweetsCount = dictionary["statuses_count"] as? Int
    }
    
    static var current: User? {
        get {
            if _current == nil {
                let defaults = UserDefaults.standard
                if let userData = defaults.data(forKey: "currentUserData") {
                    let dictionary = try! JSONSerialization.jsonObject(with: userData, options: []) as! [String: Any]
                    _current = User(dictionary: dictionary)
                }
            }
            return _current
        }
        set (user) {
            _current = user
            let defaults = UserDefaults.standard
            if let user = user {
                let data = try! JSONSerialization.data(withJSONObject: user.dictionary!, options: [])
                defaults.set(data, forKey: "currentUserData")
            } else {
                defaults.removeObject(forKey: "currentUserData")
            }
        }
    }
}
