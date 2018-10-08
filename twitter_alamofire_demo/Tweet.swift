//
//  Tweet.swift
//  twitter_alamofire_demo
//
//  Created by Claudia Nelson on 10/4/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit

class Tweet{
    
    // MARK: Properties
    var id: Int64? // For favoriting, retweeting & replying
    var text: String? // Text content of tweet
    var replyCount: Int?
    var favoriteCount: Int? // Update favorite count label
    var favorited: Bool? // Configure favorite button
    var retweetCount: Int? // Update favorite count label
    var retweeted: Bool? // Configure retweet button
    var user: User? // Author of the Tweet
    var createdAtString: String? // String representation of date posted
    var profile_image_url: URL?
    
    // For Retweets
    var retweetedByUser: User?  // user who retweeted if tweet is retweet
    
    init(dictionary: [String: Any]) {
        var dictionary = dictionary
        
        // Is this a retweet?
        if let originalTweet = dictionary["retweeted_status"] as? [String: Any]{
            let userDictionary = dictionary["user"] as! [String: Any]
            self.retweetedByUser = User(dictionary: userDictionary)
            
            dictionary = originalTweet
        }
        
        print(dictionary)
        
        id = dictionary["id"] as? Int64
        text = dictionary["text"] as? String
        favoriteCount = dictionary["favorite_count"] as? Int
        favorited = dictionary["favorited"] as? Bool
        retweetCount = dictionary["retweet_count"] as? Int
        retweeted = dictionary["retweeted"] as? Bool
//        replyCount = dictionary["reply_count"] as? Int
        replyCount = 0
        
        // Initialize User
        let user = dictionary["user"] as! [String: Any]
        self.user = User(dictionary: user)
        
        // Formatting Created At
        let createdAtOriginalString = dictionary["created_at"] as! String
        
        // Configure the input format to parse the date string
        let formatter = DateFormatter()
        
        formatter.dateFormat = "E MMM d HH:mm:ss Z y"
        // Convert String to Date
        let date = formatter.date(from: createdAtOriginalString)!
        // Configure output format
        formatter.dateStyle = .short
        formatter.timeStyle = .none
        // Convert Date to String and set the createdAtString property
        createdAtString = formatter.string(from: date)

        
        
        
        // Configure the profile image
        let userDictionary = dictionary["user"] as? NSDictionary
        let profile_image_string = userDictionary?["profile_image_url_https"] as? String
        
        if let string = profile_image_string {
            profile_image_url = URL(string: string)
        }
    }
    
    static func tweets(with array: [[String: Any]]) -> [Tweet]{
        var tweets: [Tweet] = []
        for tweetDictionary in array {
            let tweet =  Tweet(dictionary: tweetDictionary)
            tweets.append(tweet)
        }
        
        return tweets
    }

}
