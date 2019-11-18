//
//  APIHeader.h
//  AppBook
//
//  Created by rtc hubs on 11/13/19.
//  Copyright © 2019 rtc hubs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Post.h"
#import "PostResponse.h"

@interface APIHandler : NSObject



- (void)getAllPost:(void(^)(PostResponse *response, NSString *errorMessage))completionHandler;


@end
