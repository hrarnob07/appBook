//
//  ViewController.swift
//  AppBook
//
//  Created by rtc hubs on 11/12/19.
//  Copyright © 2019 rtc hubs. All rights reserved.
//

import UIKit
import Alamofire

class LoginVC: UIViewController {

    @IBOutlet weak var userIdText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func loginBtnPressed(_ sender: Any) {
        
        guard let userId = userIdText.text , userIdText.text != "" else {return}
        guard let password = passwordText.text , passwordText.text != "" else {return}
        
        if(userId == "admin" && password == "123456")
        {
            performSegue(withIdentifier: TO_LOGIN, sender: nil)
        }
        else{
            let message = "Please Enter Valid user id and password"
            let title = "Authentication"
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            alert.addAction(action)
            
            present(alert, animated: true, completion: nil)
            
        }
    }
}

