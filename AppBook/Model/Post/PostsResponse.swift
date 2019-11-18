//
//  Posts.swift
//  AppBook
//
//  Created by rtc hubs on 11/14/19.
//  Copyright © 2019 rtc hubs. All rights reserved.
//

import Foundation
import ObjectMapper

class PostsResponse: Mappable {
    var status: Bool?
    var data: [Posts]?
    var message: String?
    
    required  init?(map: Map) {
        //self.init()
    }
    
    func mapping(map: Map) {
        status <- map["status"]
        message <- map["message"]
        data <- map["data"]

    }
}

class Posts: Mappable {
    var id : Int?
    var userId: Int?
    var type: String?
    var title: String?
    var body: String?
    var createdAt: String?
    var updatedAt: String?
    
    required  init?(map: Map) {
      
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        userId <- map["user_id"]
        type <- map["type"]
        title <- map["title"]
        body <- map["body"]
        createdAt <- map["created_at"]
        updatedAt <- map["updated_at"]
    }
}
