//
//  Post.m
//  AppBook
//
//  Created by rtc hubs on 11/13/19.
//  Copyright © 2019 rtc hubs. All rights reserved.
//

#import "Post.h"

@implementation Post
+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:
  @{
                                                                  @"identifier": @"id",
                                                                  @"userId": @"user_id",
                                                                  @"createdAt": @"created_at",
                                                                  @"updatedAt": @"updated_at"
                                                                  }];
}
@end
