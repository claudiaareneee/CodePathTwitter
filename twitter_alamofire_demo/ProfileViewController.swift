//
//  ProfileViewController.swift
//  twitter_alamofire_demo
//
//  Created by Claudia Nelson on 10/13/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {


    @IBOutlet weak var followersCountLabel: UILabel!
    @IBOutlet weak var tweetCountLabel: UILabel!
    @IBOutlet weak var followingCountLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    var user: User?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let user = user{
            let username = user.screenName!
            self.navigationItem.title = "@\(username)"
            usernameLabel.text = "@\(username)"
            nameLabel.text = user.name!
            
            followersCountLabel.text = String(user.followersCount!)
            followingCountLabel.text = String(user.followingCount!)
            tweetCountLabel.text = String(user.tweetsCount!)
            
            
            if let profileHTTPSString = user.profilePicString{
                let url = URL(string: profileHTTPSString)
                profileImageView.setImageWith(url!)
                profileImageView = cicleProfileIcon(image: profileImageView)
                profileImageView.layer.borderWidth = 2
                profileImageView.layer.borderColor = UIColor.white.cgColor
            }
            
            if let backgroundString = user.backgroundPicString{
                let url = URL(string: backgroundString)
                backgroundImageView.setImageWith(url!)
            }
            
        }
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapLogout(_ sender: Any) {
        print("attempting logout")
        APIManager.logout()
    }
    
    func cicleProfileIcon(image: UIImageView) -> UIImageView{
        image.layer.masksToBounds = false
        image.layer.cornerRadius = image.frame.height/2
        image.clipsToBounds = true
        
        return image
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
