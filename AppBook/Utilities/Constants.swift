//
//  Constants.swift
//  AppBook
//
//  Created by rtc hubs on 11/12/19.
//  Copyright © 2019 rtc hubs. All rights reserved.
//

import Foundation

//completation handelar

typealias CompletionHandler  = (_ success: Bool)->()


//segues

let TO_LOGIN = "LoginSegue"

//api url

let HEADER = [
    "Content-type": "application/json; charset=UTF-8"]
let BASE_URL = "http://192.168.0.114/roqumum-api/api/v1/"

let GET_POST_URL = "\(BASE_URL)post"

let POST_URL = "\(BASE_URL)post/create"
