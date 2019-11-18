//
//  PostResponse.h
//  AppBook
//
//  Created by rtc hubs on 11/13/19.
//  Copyright © 2019 rtc hubs. All rights reserved.
//

#import <JSONModel/JSONModel.h>

NS_ASSUME_NONNULL_BEGIN


@protocol Post;

@interface PostResponse : JSONModel
@property (nonatomic, assign) BOOL status;
@property (nonatomic, copy)   NSArray<Post> *data;
@property (nonatomic, copy)   NSString *message;
@end

NS_ASSUME_NONNULL_END
