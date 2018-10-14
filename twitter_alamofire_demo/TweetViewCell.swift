//
//  TweetViewCell.swift
//  twitter_alamofire_demo
//
//  Created by Claudia Nelson on 10/5/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit
import AFNetworking
import TTTAttributedLabel

class TweetViewCell: UITableViewCell {

    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var usernameLabel: TTTAttributedLabel!
    @IBOutlet weak var nameLabel: TTTAttributedLabel!
    @IBOutlet weak var dateLabel: TTTAttributedLabel!
    @IBOutlet weak var tweetLabel: TTTAttributedLabel!
    @IBOutlet weak var comentCountLabel: TTTAttributedLabel!
    @IBOutlet weak var reTweetCountLabel: TTTAttributedLabel!
    @IBOutlet weak var favoriteCountLabel: TTTAttributedLabel!
    
    var favorited: Bool!
    var retweeted: Bool!

    var tweetDictionary: [String: Any] = [:]
    var tweet: Tweet? {
        didSet{
            favorited = false
            retweeted = false
            refreshData()
        }
    }
    
//    @IBAction func didTapReply(_ sender: Any) {
//    }
    
    @IBAction func didTapRetweet(_ sender: Any) {
        if (!retweeted) {
            APIManager.shared.retweet(tweet!){ (tweet: Tweet?, error: Error?) in
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully favorited tweet \n\(String(describing: tweet.text))")
                    self.tweet = tweet
                }
                
                
            }
        }else{
            APIManager.shared.unretweet(tweet!){ (tweet: Tweet?, error: Error?) in
                if let error = error {
                    print("Error unretweeting tweet: \(error.localizedDescription)")
                }
                else if let tweet = tweet{
                    print("Successfully unretweeted the following Tweet: \n\(String(describing: tweet.text))")
                    self.tweet = tweet
                }
            }
        }
        
        
    }
    
    @IBAction func didTapFavorite(_ sender: Any) {
        // TODO: Update the local tweet model
        print(favorited)
        if (favorited){
            APIManager.shared.unfavorite(tweet!){ (tweet: Tweet?, error: Error?) in
                if let error = error {
                    print("Error unfavoriting tweet: \(error.localizedDescription)")
                }
                else if let tweet = tweet{
                    print("Successfully unfavorited the following Tweet: \n\(String(describing: tweet.text))")
                    self.tweet = tweet
                }
            }
        }else{
            APIManager.shared.favorite(tweet!){ (tweet: Tweet?, error: Error?) in
                if let error = error {
                    print("Error favoriting tweet: \(error.localizedDescription)")
                }
                else if let tweet = tweet{
                    print("Successfully favorited the following Tweet: \n\(String(describing: tweet.text))")
                    self.tweet = tweet
                }
            }
        }
        
    }
    
    func refreshData(){
        profileImageView = self.cicleProfileIcon(image: profileImageView)
        
        if let tweet = tweet{
            nameLabel.text = tweet.user?.name
            if let username = tweet.user?.screenName{
                usernameLabel.text = "@" + username
            }
            dateLabel.text = tweet.createdAtString
            tweetLabel.text = tweet.text
            comentCountLabel.text = countToString(number: tweet.replyCount)
            reTweetCountLabel.text = countToString(number: tweet.retweetCount)
            favoriteCountLabel.text = countToString(number: tweet.favoriteCount)
            
            // MARK: Setting profile picture
            if let image_url = tweet.profile_image_url{
                profileImageView.setImageWith(image_url as URL)
            }
            
            
            retweeted = tweet.retweeted
            favorited = tweet.favorited
            
            if favorited{
                let buttonImage = UIImage(named: "favor-icon-red")
                favoriteButton.setImage(buttonImage, for: UIControlState.normal)
            } else {
                let buttonImage = UIImage(named: "favor-icon")
                favoriteButton.setImage(buttonImage, for: UIControlState.normal)
            }
            
            if retweeted{
                let buttonImage = UIImage(named: "retweet-icon-green")
                retweetButton.setImage(buttonImage, for: UIControlState.normal)
            } else {
                let buttonImage = UIImage(named: "retweet-icon")
                retweetButton.setImage(buttonImage, for: UIControlState.normal)
            }
        }
    }
    
    func cicleProfileIcon(image: UIImageView) -> UIImageView{
        image.layer.masksToBounds = false
        image.layer.cornerRadius = image.frame.height/2
        image.clipsToBounds = true
        
        return image
    }
    
    func countToString(number: Int?) -> String{
        if let number = number{
            let string = String(number)
            return string
        }else{
            return ""
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
