//
//  ConnectionDetailHelper.m
//  DemoFeedApp
//
//  Created by Siju Satheesachandran on 12/11/2018.
//  Copyright © 2018 Siju Satheesachandran. All rights reserved.
//

#import "ConnectionDetailHelper.h"


@implementation ConnectionDetailHelper

static NSString *urlBase;
static NSString *refreshEndPoint;
static NSString *loginEndPoint;
static NSString *registerEndPoint;
static NSString *personalEndPoint;
static NSString *forgetPasswordEndPoint;
static NSString *loginHTTPMethod;
static NSString *refreshHTTPMethod;
static SessionConfig *curSessionConfig;
static NSString *clientSecret;
static NSArray *hosts;

+ (ConnectionDetailHelper *)sharedConnectionDetailHelper
{
    static ConnectionDetailHelper * instance = nil;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        instance = [ConnectionDetailHelper new];
    });
    return instance;
}

+(NSString*)getURLBase
{
    return urlBase;
}

+(void)setupURLBase:(NSString*)urlBaseString
{
    urlBase = urlBaseString;
}

+(void)setupSessionConfig:(SessionConfig *)sessionConfig
{
    curSessionConfig = sessionConfig;
}

+(SessionConfig*)getSessionConfig
{
    return curSessionConfig;
}

@end
