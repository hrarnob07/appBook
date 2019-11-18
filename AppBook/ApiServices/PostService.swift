//
//  PostService.swift
//  AppBook
//
//  Created by rtc hubs on 11/13/19.
//  Copyright © 2019 rtc hubs. All rights reserved.
//

import Foundation

import Alamofire
import SwiftyJSON


class PostService {
    static let instance = PostService()
    
    func getAllPost(completion: @escaping CompletionHandler)
    {
        Alamofire.request(GET_POST_URL, method: .get , headers: HEADER).responseJSON { (response) in
            
            if response.result.error == nil {
                
                print("success<<<<<<<<<<")
                guard let data = response.data else{return}
                let json = JSON( data: data)
                let alldata = json["data"]
                
                print(alldata)
                completion(true)
            } else {
                print("error,>>>>>>>>>>>>>>>>>>>>>>")
                completion(false)
                debugPrint(response.result.error as Any)
                
            }
        }
        
    }
    
    
    func getAllPostOBJ(completion: @escaping (_ response: PostsResponse?, _ success:Bool) -> Void){
        Alamofire.request(GET_POST_URL, method: .get , headers: HEADER).responseString { (response) in
            switch(response.result){
            case .success(let responseString):
              //  print(responseString)
                let postsResponse = PostsResponse(JSONString:"\(responseString)")!
                //print(postsResponse.message!)
                completion(postsResponse, true);
                
            case .failure(let error):
                print(error)
                completion(nil, true);
            }
            
        }
        
    }
    
    
    func createPost(title : String , body : String , type : String, completion :  @escaping CompletionHandler)
    {
        
        let body:[String: Any] = [
            
            "title": title,
            "body": body,
            "type": type,
            "user_id": 1
        ]
        
        Alamofire.request(POST_URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response) in
            
            if response.result.error == nil {
                
                
                print("success<<<<<<<<<<")
                
                guard let data = response.data else{return}
                let json = JSON( data: data)
                print(json)
                
                completion(true)
            } else {
               // print("error,>>>>>>>>>>>>>>>>>>>>>>")
                
                completion(false)
                //debugPrint(response.result.error as Any)
            }
        }
        
        
    }

    
}


