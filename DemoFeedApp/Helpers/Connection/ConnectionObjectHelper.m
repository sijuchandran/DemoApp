//
//  ConnectionObjectHelper.m
//  DemoFeedApp
//
//  Created by Siju Satheesachandran on 12/11/2018.
//  Copyright © 2018 Siju Satheesachandran. All rights reserved.
//

#import "ConnectionObjectHelper.h"
#import "ConnectionDetailHelper.h"


@implementation ConnectionObjectHelper

#pragma mark - initialisation functions
+ (ConnectionObjectHelper *)sharedConnectionObjectHelper
{
    static ConnectionObjectHelper * instance;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        instance = [ConnectionObjectHelper new];
    });
    return instance;
}


+(ConnectionObject*) getPostsConnectionObject
{
    ConnectionObject *conObject = [ConnectionObject new];
    
    conObject.urlString = [NSString stringWithFormat:@"%@/posts", [ConnectionDetailHelper getURLBase]];
    conObject.httpMethod = [NSNumber numberWithInt:1];
   
    conObject.serviceName = @"getPosts";
    
    return conObject;
}

+(ConnectionObject*) getDetailsConnectionObject
{
    ConnectionObject *conObject = [ConnectionObject new];
    
    conObject.urlString = [NSString stringWithFormat:@"%@/users", [ConnectionDetailHelper getURLBase]];
    conObject.httpMethod = [NSNumber numberWithInt:1];
   
    conObject.serviceName = @"getDetails";
    
    return conObject;
}


@end
