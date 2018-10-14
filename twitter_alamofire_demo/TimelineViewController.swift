//
//  TimelineViewController.swift
//  twitter_alamofire_demo
//
//  Created by Aristotle on 2018-08-11.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit

class TimelineViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, CreateViewControllerDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    
    var tweets: [Tweet] = []
    let backgroundView = UIView() //for the background of selected tweets
    
    //Initialize a UIRefreshControl
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Refresh Control action
        refreshControl.addTarget(self, action: #selector(refreshControlAction(_:)), for: UIControlEvents.valueChanged)
        
        // add refresh control to table view
        tableView.insertSubview(refreshControl, at: 0)
        
        //Reload Data
        tableView.dataSource = self
        tableView.delegate = self
        getData()
    }
    
    // MARK: Logout
    @IBAction func logout(_ sender: Any) {
        print("attempting logout")
        APIManager.logout()
    }
    
    
    // MARK: Data Request
    func getData(){
        APIManager.shared.getHomeTimeLine { (tweets: [Tweet]?, error: Error?) in
            if let tweets = tweets {
                self.tweets = tweets
            }
            if let error =  error{
                print(error.localizedDescription)
            }
            self.refreshControl.endRefreshing()
            self.tableView.reloadData()
        }
    }
    
    
    // MARK: TableView functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Tweets.count = \(tweets.count)")
        return tweets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TweetCell", for: indexPath) as! TweetViewCell
        
        backgroundView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        cell.selectedBackgroundView = backgroundView
        cell.tweet = tweets[indexPath.row]
        return cell
    }
    
    func did(post: Tweet) {
        getData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("HERE")
        if(segue.identifier == "DetailSegue"){
            let cell = sender as! UITableViewCell
            if let indexPath = tableView.indexPath(for: cell){
                let tweet = tweets[indexPath.row]
                if let detailVC = segue.destination as? DetailViewController{
                    print("third")
                    detailVC.tweet = tweet
                }
            }
        }else if(segue.identifier == "newPostSegue"){
            print("Posting")
        }
    }
    
    func refreshControlAction(_ refreshControl: UIRefreshControl){
        // Request:
        getData()
    }
    
    
    // Mark: Memory Warning
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
