//
//  Post.h
//  AppBook
//
//  Created by rtc hubs on 11/13/19.
//  Copyright © 2019 rtc hubs. All rights reserved.
//

#import <JSONModel/JSONModel.h>

NS_ASSUME_NONNULL_BEGIN

@interface Post : JSONModel
@property (nonatomic, assign) NSInteger identifier;
@property (nonatomic, assign) NSInteger userId;
@property (nonatomic, copy)   NSString *type;
@property (nonatomic, copy)   NSString *title;
@property (nonatomic, copy)   NSString *body;
@property (nonatomic, copy)   NSString *createdAt;
@property (nonatomic, copy)   NSString *updatedAt;

@end

NS_ASSUME_NONNULL_END
