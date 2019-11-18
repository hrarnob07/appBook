//
//  AddThoughtVC.swift
//  AppBook
//
//  Created by rtc hubs on 11/12/19.
//  Copyright © 2019 rtc hubs. All rights reserved.
//

import UIKit

class AddThoughtVC: UIViewController {

    @IBOutlet weak var segmentControll: UISegmentedControl!
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var bodyText: UITextView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    var type: String = "funny"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        spinner.isHidden = true
        spinner.stopAnimating()
    }
    
    @IBAction func segmentControllBtnPressed(_ sender: Any) {
        if segmentControll.selectedSegmentIndex == 0 {
            type = "funny"
        }
        else if segmentControll.selectedSegmentIndex == 1 {
            type = "serious"
        }
        else{
            type = "crazy"
        }

        
    }
    
    @IBAction func postBtnPressed(_ sender: Any) {
        
        guard let title = titleText.text , titleText.text != "" else {return}
        
        guard let body = bodyText.text , bodyText.text != "" else {return}
        
        spinner.isHidden = false
        spinner.startAnimating()
        
        PostService.instance.createPost(title: title, body: body, type: type) { (success) in
            if(success)
            {
                self.titleText.text = ""
                self.bodyText.text = ""
                self.spinner.isHidden = true
                self.spinner.stopAnimating()
                self.showAlart(message: "Post successfully created", title: "Post")
                
            }
            else{
                self.spinner.isHidden = true
                self.spinner.stopAnimating()
                
                self.showAlart(message: "Ops...! Try again", title: "Post")
                
            }
        }
        
    }
    
    func showAlart( message : String , title : String)
    {
        let message = message
        let title = title
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
}
