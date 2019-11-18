//
//  APIHandler.m
//  AppBook
//
//  Created by rtc hubs on 11/13/19.
//  Copyright © 2019 rtc hubs. All rights reserved.
//

#import "APIHandler.h"

@implementation APIHandler

+(APIHandler*)sharedHandler{
    
    static APIHandler *handler = nil;
    if (!handler){
        handler = [[APIHandler alloc]init];
    }
    return handler;
}


- (void)makeRequestWithUrl:(NSString*)urlString completion:(void(^)(id response, NSError *error))completionhandler{
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (!error){
                id dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                completionhandler(dict, error);
            }
            else{
                completionhandler(nil, error);
            }
        });
    }];
    [task resume];
}

- (void)getAllPost:(void(^)(PostResponse *response, NSString *errorMessage))completionHandler{
    
    NSString *urlString = @"http://192.168.0.114/roqumum-api/api/v1/post";
   // NSString *urlString = @"http://192.168.31.152/roqumum-api/api/v1/post";

    [self makeRequestWithUrl:urlString completion:^(id response, NSError *error) {
        if (!error){
            
            NSLog(@"response: %@", response);
            
            if (response){
                
                NSError *jsonParseError = nil;
                PostResponse *postResponse = [[PostResponse alloc] initWithDictionary:response error:&jsonParseError];
                if (!jsonParseError){
                    completionHandler(postResponse, error.localizedDescription);
                }
                else{
                    NSLog(@"JsonEror: %@", jsonParseError.localizedDescription);
                }
                
            }
            
        }
            
    }];
    
}


@end
