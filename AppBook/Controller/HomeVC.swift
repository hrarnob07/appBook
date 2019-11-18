//
//  HomeVC.swift
//  AppBook
//
//  Created by rtc hubs on 11/12/19.
//  Copyright © 2019 rtc hubs. All rights reserved.
//

import UIKit

class HomeVC: UIViewController ,  UITableViewDelegate ,UITableViewDataSource {
    @IBOutlet weak var postSegmentConrtoll: UISegmentedControl!
    var allPost = [Posts]()
    var selectedPost = [Posts]()
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var postTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postTableView.dataSource = self
        postTableView.delegate = self
        spinner.isHidden = false
        spinner.startAnimating()
        
        getAllMyPost()
    }
    func getAllMyPost(){
        PostService.instance.getAllPostOBJ { (postResponse, isSuccess) in
            if(isSuccess)
            {
                //print(postResponse as Any)
                //print(postResponse?.data)
                
//                for value in (postResponse?.data!)!
//                {
//                    print(value.title)
//                    print(value.body)
//                }
                self.allPost = (postResponse?.data!)!
               // self.selectedPost = (postResponse?.data!)!
                
//                for i in self.allPost
//                {
//                    print(i.title)
//                }
                
                self.postTableView.reloadData()
                self.spinner.isHidden = true
                self.spinner.stopAnimating()
                
                
            }
            else{
                print("error")
                
                self.spinner.isHidden = true
                self.spinner.stopAnimating()
                

            }
        }
        
    }
    
    // get post all post
    
    @IBAction func postSegmentBtnPressed(_ sender: Any) {
        
        print("segment btn trigger")
        
        if postSegmentConrtoll.selectedSegmentIndex == 0{
            getAllMyPost()
        }
        
        
//        selectedPost = allPost.filter{$0.type == "serious"}
//
//        postTableView.reloadData()
//
//        selectedPost.forEach{ print("body of serious :\($0.body) type : \($0.type)")}
//
//        allPost.forEach{ print("all postbody of serious :\($0.body) type : \($0.type)")}

        
         else if postSegmentConrtoll.selectedSegmentIndex == 1 {
            selectedPost = allPost.filter { $0.type == "serious"
            }
            
        }
         
         
        
       else if postSegmentConrtoll.selectedSegmentIndex == 2 {
            selectedPost = allPost.filter{$0.type == "crazy" }
        }
        else {
            selectedPost = allPost.filter{$0.type == "funny" }
        }
        
        if(selectedPost.count > 0){
            postTableView.reloadData()
        }
        
       
        
      /*  APIHandler().getAllPost { (response, errorString) in
            
            if (response != nil){
                //print(response!)
                print(response?.data)
                
                for post in (response?.data)!{
                    
                    print(post)
                }
            }
        }
*/
 
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("table view call --->")
        
        if let cell = postTableView.dequeueReusableCell(withIdentifier: "postCell") as? Postcell{
            if(postSegmentConrtoll.selectedSegmentIndex == 0){
                let posts = allPost[indexPath.row]
                cell.configurePost(posts: posts)
                
            }
            else if postSegmentConrtoll.selectedSegmentIndex == 1 {
                let posts = selectedPost[indexPath.row]
                cell.configurePost(posts: posts)
            }
            
            
            
            return cell
        }
        else {
            
            return Postcell()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        
        if(postSegmentConrtoll.selectedSegmentIndex == 0){
           return allPost.count
            
        }
        else {
            return selectedPost.count
        }

    }
    
    

}
