//
//  CreateViewController.swift
//  twitter_alamofire_demo
//
//  Created by Claudia Nelson on 10/13/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit

protocol CreateViewControllerDelegate: class {
    func did(post: Tweet)
}

class CreateViewController: UIViewController, UITextViewDelegate {
    
    weak var delegate: CreateViewControllerDelegate?

    @IBOutlet weak var charCountLabel: UILabel!
    @IBOutlet weak var tweetTextView: UITextView!
    @IBOutlet weak var profileImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tweetTextView.delegate = self
        
        if let profileImageString = User.current?.profilePicString{
            let profileImageURL = URL(string: profileImageString)!
            profileImageView.setImageWith(profileImageURL)
            profileImageView = cicleProfileIcon(image: profileImageView!)
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        // Check the proposed new text character count
        // Set the max character limit
        let characterLimit = 140
        
        // Construct what the new text would be if we allowed the user's latest edit
        let newText = NSString(string: textView.text!).replacingCharacters(in: range, with: text)
    
        
        // TODO: Update Character Count Label
        charCountLabel.text = "Characters remaining: \(140 - newText.count)/140"
        
        // The new text should be allowed? True/False
        return newText.count < characterLimit
        
        // Allow or disallow the new text
    }
    
    
    @IBAction func didTapPost(_ sender: Any) {
        if let tweetString = tweetTextView.text{
            APIManager.shared.composeTweet(with: tweetString) { (tweet, error) in
                if let error = error {
                    print("Error composing Tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    self.delegate?.did(post: tweet)
                    print("Compose Tweet Success!")
                }

            }
        }
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
